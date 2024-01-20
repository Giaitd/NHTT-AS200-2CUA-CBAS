import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../helper/language.dart';

class Screen1Service extends GetxService {
  final storage = new FlutterSecureStorage();

  static List<String> listFault = [];
  static List<String> timeFault = [];
  static String timeOfDay = "";

  //constant
  RxDouble sizeDevice = 1.0.obs;

  RxString serialDevice = ''.obs;

  //biến trạng thái hệ thống
  RxString status_detail = 'Trạng thái hoạt động'.obs;
  RxString status = 'xxx'.obs;
  //send to app
  RxInt number_status_detail = 0.obs;
  RxInt number_status = 0.obs;

  //biến chương trình
  RxString program_name = 'Chọn chương trình chạy'.obs;
  RxString program = '...'.obs;
  RxDouble font_size_program = 65.0.obs;

  RxDouble temp_set = 0.0.obs;
  RxDouble press_set = 0.0.obs;
  RxDouble ster_time_set = 0.0.obs;
  RxInt dry_time_set = 0.obs;

  //biến máy in
  // RxBool enable_printer = false.obs;
  RxInt cycle_printer = 60.obs;
  RxBool reachTAndP = false.obs;

  //trạng thái cửa
  RxInt door_status = 0.obs;
  RxBool allowStart = false.obs;

  //T
  RxDouble temp = 121.0.obs;
  RxDouble temp_offset = 0.0.obs;
  RxDouble press = (-0.05).obs;
  RxDouble press_offset = 0.0.obs;

  //biến cài đặt HCK
  RxInt numberVacuum_set = 1.obs;
  RxDouble pressVacuum_set = (-0.5).obs;

  //biến cài đặt thời gian xả
  RxInt timeExhaust_set = 2.obs;

  //biến thông số đếm lùi khi chạy
  RxInt number1 = 10.obs;
  RxString space = ' : '.obs;
  RxInt number2 = 30.obs;

  //Biến Start/Stop
  RxBool startStop = false.obs;
  RxBool errorStatus = false.obs;

  //Số mẻ hấp hoàn thành
  RxInt complete_number_1 = 0.obs;
  RxInt complete_number_2 = 0.obs;

  //Vận hành tay
  RxBool man_bomhoi = false.obs;
  RxBool man_xanhanh = false.obs;
  RxBool man_xacham = false.obs;
  RxBool man_hck = false.obs;
  RxBool man_cba = false.obs;
  RxBool man_capnuocmat = false.obs;
  RxBool man_capkhigioang1 = false.obs;
  RxBool man_xakhigioang1 = false.obs;
  RxBool man_capkhigioang2 = false.obs;
  RxBool man_xakhigioang2 = false.obs;
  RxBool man_xadaynoihoi = false.obs;
  RxBool man_xamaynenkhi = false.obs;
  RxBool man_bomnuoc = false.obs;
  RxBool manual_mode = false.obs;
  RxBool btnReset = true.obs;

  // data input output receive
  RxInt dataQ0 = 0.obs;
  RxInt dataQ1 = 0.obs;
  RxInt dataI0 = 0.obs;

  RxList q0 = [false, false, false, false, false, false, false, false].obs;
  RxList q1 = [false, false, false, false, false, false, false, false].obs;
  RxList i0 = [false, false, false, false, false, false, false, false].obs;

  //data save for program parameter
  Map<String, dynamic> mapProgram = {
    "programName": "9",
    "programNameFull": "9",
    "programTemp": "134.0",
    "programTimeSter": "42",
    "programTimeDry": "7",
    "programPress": "1.01",
  }.obs;

  List<String> keyProgram = [
    "programName",
    "programNameFull",
    "programTemp",
    "programTimeSter",
    "programTimeDry",
    "programPress"
  ].obs;
  //

  //data save for setup parameter
  Map<String, dynamic> mapSetup = {
    "offsetT": "0.0",
    "numberVacuum": "2",
    "pressVacuum": "-0.5",
    "printerOnOff": "true",
    "cyclePrinter": "60",
    "numberCycleCompleted": "0",
    "timeExhaust": "2",
    "offsetP": "0.0"
  }.obs;

  List<String> keySetup = [
    "offsetT",
    "numberVacuum",
    "pressVacuum",
    "printerOnOff",
    "cyclePrinter",
    "numberCycleCompleted",
    "timeExhaust",
    "offsetP"
  ].obs;

  RxBool enableStatusErr = false.obs;
  RxString notificationMessage = "".obs;
  RxBool enableStatusCompleted = false.obs;
  RxBool enableStatusStart = false.obs;

  RxList<dynamic> dataError = <dynamic>[].obs;
  RxList<dynamic> listDataError = <dynamic>[].obs;
  bool checkCondition = true;

  @override
  void onInit() {
    super.onInit();

    complete_number_2.value = complete_number_1.value;
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      _getnumber();
      _getData();
      _getListErrorData();
    });

    // Timer.periodic(Duration(milliseconds: 5000), (timer) {
    //   print("object====press= ${press.value}");
    //   print("object====offset= ${mapSetup["offsetP"]}");
    // });
    Future.delayed(Duration(seconds: 10), () {
      sendCyclePrinter();
    });
  }

  /**================ secure storage ==================**/
  //read/write data setup
  //write
  Future<void> writeDataSetup(int i) async {
    List<dynamic> values = [
      temp_offset.value.toString(),
      numberVacuum_set.value.toString(),
      pressVacuum_set.value.toString(),
      mapSetup["printerOnOff"],
      cycle_printer.value.toString(),
      (int.parse(mapSetup["numberCycleCompleted"]) + 1).toString(),
      timeExhaust_set.value.toString(),
      press_offset.value.toString(),
    ];
    await storage.write(
      key: keySetup[i],
      value: values[i],
      aOptions: getAndroidOptions(),
    );
    readOneDataSetup(i);
  }

  //read=====================================
  Future<void> readDataSetup() async {
    for (int i = 0; i < keySetup.length; i++) {
      var tg = (await storage.read(
        key: keySetup[i],
        aOptions: getAndroidOptions(),
      ));
      if (tg != null) {
        mapSetup[keySetup[i]] = tg.toString();
      }
    }
  }

  Future<void> readOneDataSetup(int j) async {
    mapSetup[keySetup[j]] = (await storage.read(
      key: keySetup[j],
      aOptions: getAndroidOptions(),
    ));
  }

  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  /**======================================================== */

  /**============ MethodChannel=== send/get data to/from native ====================== */

  static const platform = MethodChannel('giaitd.com/data');

  //get-set data from native code
  Future<void> _getnumber() async {
    //date-time
    DateTime time = new DateTime.now();
    var formatterDate = DateFormat('dd/MM/yyyy');
    var formatterTime = DateFormat('kk:mm:ss');
    String day = formatterDate.format(time);
    String timeOfDay = formatterTime.format(time);

    var sendDataToNative = <String, dynamic>{
      //data secure storage
      "programSet": mapProgram["programName"],
      "tempSet": double.parse(mapProgram["programTemp"]),
      "sterTimeSet": double.parse(mapProgram["programTimeSter"]),
      "dryTimeSet": int.parse(mapProgram["programTimeDry"]),
      "pressVacuumSet": double.parse(mapSetup["pressVacuum"]),
      "numberVacuumSet": int.parse(mapSetup["numberVacuum"]),
      "tempOffset": double.parse(mapSetup["offsetT"]),
      "printerEnable":
          (mapSetup["printerOnOff"].toString().toLowerCase() == 'true'),
      "timeExhaustSet": int.parse(mapSetup["timeExhaust"]),
      "pressOffset": double.parse(mapSetup["offsetP"]),
      "pressSet": double.parse(mapProgram["programPress"]),

      //non-save
      "startStop": startStop.value,
      "manualMode": manual_mode.value,
      "day": day,
      "timeOfDay": timeOfDay,
    };

    try {
      errorStatus.value =
          await platform.invokeMethod('dataToNative', sendDataToNative);
      if (errorStatus.value == true) {
        startStop.value = false;
        btnReset.value = false;
        Future.delayed(Duration(milliseconds: 1000), () {
          checkCondition = false;
        });
      } else
        checkCondition = true;
    } on PlatformException catch (e) {
      print(e);
      temp_offset.value = -100;
    }
  }

  Future<void> sendCyclePrinter() async {
    var sendCyclePrinter = <String, dynamic>{
      "cyclePrinter": int.parse(mapSetup["cyclePrinter"]),
    };
    try {
      await platform.invokeMethod('cyclePrinter', sendCyclePrinter);
    } on PlatformException catch (e) {
      print(e);
    }
    print("cycle === flu ${int.parse(mapSetup["cyclePrinter"])}");
  }

  //get-set data from native code
  Future<void> _getData() async {
    Map<dynamic, dynamic> getDataValues = {};

    try {
      getDataValues = await platform.invokeMethod('getData');
      temp.value = getDataValues['getTemp'];
      press.value = getDataValues['getPress'];
      number_status.value = getDataValues['getStatus'];
      number_status_detail.value = getDataValues['getStatusDetail'];
      reachTAndP.value = getDataValues['getReachTAndP'];
      number1.value = getDataValues['getMinCount'];
      number2.value = getDataValues['getSecCount'];
      complete_number_1.value = getDataValues['getCompleteNumber'];
      allowStart.value = getDataValues['allowStart'];
      door_status.value = getDataValues['door'];

      dataQ0.value = getDataValues['q0'];
      dataQ1.value = getDataValues['q1'];
      dataI0.value = getDataValues['i0'];
    } on PlatformException catch (e) {
      print(e);
    }

    for (int i = 0; i < 8; i++) {
      q0[i] = (dataQ0 & (1 << i)) != 0;
      q1[i] = (dataQ1 & (1 << i)) != 0;
      i0[i] = (dataI0 & (1 << i)) != 0;
    }

    if (complete_number_1.value > complete_number_2.value) {
      writeDataSetup(5);
      complete_number_2.value = complete_number_1.value;
    }
  }

  //get list error
  Future<void> _getListErrorData() async {
    if (errorStatus.value == true && checkCondition == true) {
      try {
        final listError = await platform.invokeMethod('getListError');
        if (listError != null) {
          //lấy dữ liệu đang được lưu
          var a = await storage.read(
              key: 'listError', aOptions: getAndroidOptions());
          if (a != null) {
            dataError.value = jsonDecode(a);
          }

          // giới hạn số lỗi hiển thị là 100
          while (dataError.length > 100) dataError.removeAt(0);

          //thêm dữ liệu vào list
          for (int j = listError.length - 1; j >= 0; j--) {
            dataError.add(listError[j]);
          }

          //convert sang json để lưu
          var x = jsonEncode(dataError);
          await storage.delete(key: "listError", aOptions: getAndroidOptions());
          await storage.write(
              key: "listError", value: x, aOptions: getAndroidOptions());
        }
      } on PlatformException catch (e) {
        print(e);
      }
    }
  }
  /**======================================================== */

  //get-set data from native code: convert data
  Future<void> convertData(BuildContext context) async {
    switch (number_status.value) {
      case 0:
        status.value = languageText(context, "status_0");
        break;
      case 1:
        status.value = languageText(context, "status_1");
        break;
      case 2:
        status.value = languageText(context, "status_2");
        break;
      case 3:
        status.value = languageText(context, "status_3");
        break;
    }

    switch (number_status_detail.value) {
      case 0:
        status_detail.value = languageText(context, "status_detail_0");
        break;
      case 1:
        status_detail.value = languageText(context, "status_detail_1");
        break;
      case 2:
        status_detail.value = languageText(context, "status_detail_2");
        break;
      case 3:
        status_detail.value = languageText(context, "status_detail_3");
        break;
      case 4:
        status_detail.value = languageText(context, "status_detail_4");
        break;
      case 5:
        status_detail.value = languageText(context, "status_detail_5");
        break;
      case 6:
        status_detail.value = languageText(context, "status_detail_6");
        break;
      case 7:
        status_detail.value = languageText(context, "status_detail_7");
        break;
    }
  }
}
