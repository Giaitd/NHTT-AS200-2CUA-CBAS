import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/helper/language.dart';
import 'package:iotsupperapp/services/backend_service.dart';
import 'package:iotsupperapp/services/mqtt_service.dart';
import 'package:iotsupperapp/services/screen1_service.dart';
import 'package:iotsupperapp/services/url/url.dart';

class ServerService extends GetxService {
  final storage = FlutterSecureStorage();
  MqttService mqttService = Get.put(MqttService());
  BackendService backendService = Get.put(BackendService());
  Screen1Service screen1service = Get.put(Screen1Service());
  RxList<dynamic> duLieuMeHap = <dynamic>[].obs;
  RxString maMeHap = ''.obs;
  //biến dùng khi ghi nhật ký mẻ hấp
  bool addQTDK = false;
  bool addQTTT = false;
  bool addTinhTimeTT = false;
  bool addQTSK = false;
  bool addKetThuc = false;
  RxBool addLoiKhiChay = false.obs;
  Timer? timer30s;

  Future<void> changeServer(BuildContext context, String server, String port,
      String username, String password) async {
    mqttService.startRequest(title: languageText(context, 'anoun_dialog_5'));
    //xóa data cũ
    await storage.delete(key: 'server', aOptions: _getAndroidOptions());
    await storage.delete(key: 'port', aOptions: _getAndroidOptions());
    await storage.delete(key: 'username', aOptions: _getAndroidOptions());
    await storage.delete(key: 'password', aOptions: _getAndroidOptions());

    await storage.write(
        key: 'server', value: server, aOptions: _getAndroidOptions());
    await storage.write(
        key: 'port', value: port, aOptions: _getAndroidOptions());
    await storage.write(
        key: 'username', value: username, aOptions: _getAndroidOptions());
    await storage.write(
        key: 'password', value: password, aOptions: _getAndroidOptions());

    mqttService.serverMqtt.value = server;
    mqttService.portServer.value = int.parse(port);
    mqttService.username.value = username;
    mqttService.password.value = password;

    mqttService.getClient().disconnect();
    await mqttService.mqttConnect();
    EasyLoading.dismiss();
    mqttService.endRequest();
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<void> layDuLieuMeHap(BuildContext context) async {
    mqttService.startRequest(
        title: languageText(context,
            'anoun_dialog_4')); //sau 30s mà k lấy được dữ liệu thì báo lỗi
    var responseGet = await backendService.getRequestWithoutToken(
        urlLayDuLieuMeHap, {'q': '${mqttService.serialDevice.value}'});
    duLieuMeHap.clear();
    duLieuMeHap = RxList<dynamic>(responseGet['data']);
    mqttService.endRequest();
    // print('data======  $duLieuMeHap');
  }

  void getMaMeHap() {
    var timeStampSecond =
        (DateTime.now().microsecondsSinceEpoch / 1000000).round().toString();
    maMeHap.value = mqttService.androidBoxInfo.value + '_' + timeStampSecond;
    print('data=====date= ${maMeHap.value}');
  }

  Future<void> addDuLieuMeHap(String trangThaiMeHap) async {
    await backendService.postRequestWithoutToken(urlThemDuLieuMeHap, {}, body: {
      "loai": "noihapcuangang",
      "serialThietBi": mqttService.serialDevice.value.toString(),
      "ma": maMeHap.value,
      "chuongTrinhChay": [
        "${screen1service.mapProgram["programName"]}",
        "${screen1service.mapProgram["programTemp"]}",
        "${screen1service.mapProgram["programTimeSter"]}",
        "${screen1service.mapProgram["programTimeDry"]}"
      ],
      "trangThai": trangThaiMeHap,
      "nhietDo": screen1service.temp.value
    });
  }

  void dayDuLieuLenServer() async {
    //dữ liệu bắt đầu chạy và hủy bởi nvvh thì ở function khi ấn startStop
    if (screen1service.number_status_detail.value == 2 && addQTDK == false) {
      await addDuLieuMeHap('Quá trình đuổi khí');
      addQTDK = true;
    }

    if (screen1service.number_status_detail.value == 3 && addQTTT == false) {
      await addDuLieuMeHap('Quá trình tiệt trùng');
      addQTTT = true;
    }

    if (screen1service.number_status_detail.value == 3 &&
        screen1service.reachTAndP.value == true &&
        addTinhTimeTT == false) {
      await addDuLieuMeHap('Tính thời gian tiệt trùng');
      await addDuLieuMeHap('Nhiệt độ, áp suất tiệt trùng');
      if (timer30s != null) timer30s!.cancel();
      timer30s = Timer.periodic(Duration(seconds: 30), (timer) async {
        await addDuLieuMeHap('Nhiệt độ, áp suất tiệt trùng');
      });
      addTinhTimeTT = true;
    }

    if (screen1service.number_status_detail.value == 4 && addQTSK == false) {
      await addDuLieuMeHap('Nhiệt độ, áp suất tiệt trùng');
      stopTimer30s();
      await addDuLieuMeHap('Quá trình sấy khô');
      addQTSK = true;
    }

    if (screen1service.number_status_detail.value == 5 && addKetThuc == false) {
      await addDuLieuMeHap('Mẻ hấp hoàn thành');
      addKetThuc = true;
    }

    if (screen1service.number_status.value == 3 &&
        addLoiKhiChay.value == false &&
        maMeHap.value != '') {
      stopTimer30s();
      await addDuLieuMeHap('Xảy ra lỗi khi chạy');
      // resetBienNho();
      addLoiKhiChay.value = true;
    }
  }

  void stopTimer30s() {
    if (timer30s != null) timer30s!.cancel();
  }

  void resetBienNho() {
    maMeHap.value = '';
    addQTDK = false;
    addQTTT = false;
    addTinhTimeTT = false;
    addQTSK = false;
    addKetThuc = false;
    // addLoiKhiChay = false; //được reset khi nhấn button reset
  }
}
