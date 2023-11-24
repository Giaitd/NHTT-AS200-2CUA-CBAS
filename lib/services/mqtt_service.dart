import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/services/backend_service.dart';
import 'package:iotsupperapp/services/screen1_service.dart';
import 'package:iotsupperapp/services/url/url.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService extends GetxService {
  Screen1Service screen1service = Get.put(Screen1Service());
  BackendService backendService = Get.put(BackendService());
  final storage = new FlutterSecureStorage();
  MqttServerClient? client;

  //deviceId
  RxString androidBoxInfo = 'info'.obs;
  RxString serialDevice = ''.obs;
  String topic = '';
  RxString serverMqtt = 'hongphat41.egt.vn'.obs;
  RxInt portServer = 1883.obs;
  RxString username = 'hongphat_app'.obs;
  RxString password = '12345678'.obs;

  //dùng cho mqtt
  RxString enablePubMqtt = 'false'.obs;

  Timer? timer1;

  @override
  void onInit() {
    super.onInit();
    initFunction();

    //thông báo trạng thái lên server
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      publishMqtt();
      if (screen1service.number_status.value == 1) {
        if (screen1service.enableStatusStart.value == false) {
          screen1service.notificationMessage.value = "Bat dau chay me hap";
          publishNotificationMqtt();
          screen1service.enableStatusStart.value = true;
        }
      } else if (screen1service.number_status.value == 3) {
        if (screen1service.enableStatusErr.value == false) {
          screen1service.notificationMessage.value =
              "Xay ra loi khi chay. Hay kiem tra ngay";
          publishNotificationMqtt();
          screen1service.enableStatusErr.value = true;
        }
      } else if (screen1service.number_status.value == 2) {
        if (screen1service.enableStatusCompleted.value == false) {
          screen1service.notificationMessage.value = "Me hap da hoan thanh";
          publishNotificationMqtt();
          screen1service.enableStatusCompleted.value = true;
        }
      } else if (screen1service.number_status.value == 0) {
        screen1service.enableStatusErr.value = false;
        screen1service.enableStatusCompleted.value = false;
        screen1service.enableStatusStart.value = false;
      }
    });

    //gửi trạng thái device lên app
    Timer.periodic(Duration(seconds: 10), (timer) {
      publishMqttToCheckOnline();
    });
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  void initFunction() async {
    String? s1 =
        (await storage.read(key: 'server', aOptions: _getAndroidOptions()))
            .toString();
    String? s2 =
        (await storage.read(key: 'port', aOptions: _getAndroidOptions()))
            .toString();
    username.value =
        (await storage.read(key: 'username', aOptions: _getAndroidOptions()))
            .toString();
    password.value =
        (await storage.read(key: 'password', aOptions: _getAndroidOptions()))
            .toString();
    if (s2 != 'null' && s1 != 'null') {
      serverMqtt.value = s1;
      portServer.value = int.parse(s2);
    }

    await getDeviceInfo();
    await saveUserOwnerId();
    await mqttConnect();
  }

  //get androidBoxInfo
  Future<void> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo deviceData = await deviceInfoPlugin.androidInfo;
      androidBoxInfo.value = deviceData.androidId!;
    }
  }

  //đây là topic để pub data
  Future<void> saveUserOwnerId() async {
    String? a =
        await storage.read(key: 'userOwnerId', aOptions: _getAndroidOptions());
    if (a == null) {
      print('mqtt======mqtt fetch server');
      var response = await backendService
          .getRequestWithoutToken(urlGetUserId, {'q': androidBoxInfo.value});
      if (response['status'] == 200) {
        await storage.delete(
            key: 'userOwnerId', aOptions: _getAndroidOptions());
        await storage.write(
            key: 'userOwnerId',
            value: response['data']['mainUserId'].toString(),
            aOptions: _getAndroidOptions());
        await storage.delete(
            key: 'serialDevice', aOptions: _getAndroidOptions());
        await storage.write(
            key: 'serialDevice',
            value: response['data']['serial'].toString(),
            aOptions: _getAndroidOptions());
        topic = response['data']['mainUserId'].toString();
        serialDevice = response['data']['serial'];
      } else {
        topic = (await storage.read(
                key: 'userOwnerId', aOptions: _getAndroidOptions()))
            .toString();
        serialDevice.value = (await storage.read(
                key: 'serialDevice', aOptions: _getAndroidOptions()))
            .toString();
      }
    } else {
      print('mqtt======mqtt not fetch server');
      topic = a.toString();
      serialDevice.value = (await storage.read(
              key: 'serialDevice', aOptions: _getAndroidOptions()))
          .toString();
    }
  }

  //get client server
  MqttServerClient getClient() {
    if (client == null)
      client = MqttServerClient.withPort(
          serverMqtt.value, androidBoxInfo.value.toString(), portServer.value);
    return client!;
  }

  //mqtt
  Future<void> mqttConnect() async {
    if (client == null) {
      client = MqttServerClient.withPort(
          serverMqtt.value, androidBoxInfo.value.toString(), portServer.value);
    }

    client!.logging(on: false);
    client!.keepAlivePeriod = 20;
    client!.onConnected = onConnected;
    client!.onDisconnected = onDisconnected;
    client!.pongCallback = pong;
    client!.autoReconnect = true;
    client!.onSubscribed = onSubscribed;

    final connMess = MqttConnectMessage()
        .authenticateAs(username.value, password.value)
        .withClientIdentifier(
            androidBoxInfo.value) //must be unique for each device
        .withWillTopic(
            'willtopic') // If you set this you must set a will message
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    print('mqtt====client connecting....');
    client!.connectionMessage = connMess;
    try {
      await client!.connect();
      if (client!.connectionStatus!.state == MqttConnectionState.connected) {
        print('mqtt====client connected');
      } else {
        print('mqtt====connection failed, stt=${client!.connectionStatus}');
        client!.disconnect();
        exit(-1);
      }

      //subscription ========================================================
      client!.subscribe(topic, MqttQos.atMostOnce);

      /// The client has a change notifier object(see the Observable class) which we then listen to to get
      /// notifications of published updates to each subscribed topic.
      client!.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
        final recMess = c![0].payload as MqttPublishMessage;
        final pt =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        Map<String, dynamic> json_decode = jsonDecode(pt);
        if (json_decode['status'] == "deviceReceive" &&
            json_decode['serial'] == screen1service.mapSetup["serialNumber"]) {
          var json = json_decode['message'];
          enablePubMqtt.value = json['enablePubMqtt'];
        }
      });
      publishMqtt();
    } catch (e) {
      print('mqtt====err = $e');
    }
  }

  //function publish data to mqtt
  publishMqtt() async {
    if (enablePubMqtt.value == "true") {
      final builder = MqttClientPayloadBuilder();
      builder.addString(json.encode({
        "status": "appReceive",
        "deviceInfo": androidBoxInfo.value,
        "message": {
          "status": "${screen1service.number_status.value}",
          "statusDetail": "${screen1service.number_status_detail.value}",
          "nhietDo": "${screen1service.temp.value}",
          "minCount": "${screen1service.number1.value}",
          "secCount": "${screen1service.number2.value}",
          "program": "${screen1service.mapProgram["programName"]}",
          "tempSet": "${screen1service.mapProgram["programTemp"]}",
          "sterTimeSet": "${screen1service.mapProgram["programTimeSter"]}",
          "dryTimeSet": "${screen1service.mapProgram["programTimeDry"]}",
        }
      }));

      getClient().publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
    }
  }

  publishMqttToCheckOnline() async {
    if (enablePubMqtt.value == "false") {
      final builder = MqttClientPayloadBuilder();
      builder.addString(json.encode({
        "status": "appReceive",
        "deviceInfo": androidBoxInfo.value,
        "message": {}
      }));
      getClient().publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
    }
  }

  publishNotificationMqtt() async {
    String pub1Topic = "hongphat";
    final builder1 = MqttClientPayloadBuilder();
    builder1.addString(json.encode({
      "serial": serialDevice.value,
      "message": screen1service.notificationMessage.value,
    }));

    getClient()
        .publishMessage(pub1Topic, MqttQos.exactlyOnce, builder1.payload!);
  }

  void onDisconnected() {}

  void onConnected() {}

  void onSubscribed(String topic) {}
  void pong() {}

  void startRequest({int delay = 20, String title = ''}) {
    if (timer1 != null) timer1!.cancel();
    timer1 = new Timer(Duration(seconds: delay), () {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_LONG,
          msg: title,
          fontSize: 24 / screen1service.sizeDevice.value,
          gravity: ToastGravity.TOP);
      EasyLoading.dismiss();
    });
  }

  void endRequest() {
    if (timer1 != null) timer1!.cancel();
    EasyLoading.dismiss();
  }
}
