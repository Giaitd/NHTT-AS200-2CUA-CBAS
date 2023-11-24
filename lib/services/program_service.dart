import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/services/screen1_service.dart';

class ProgramService extends GetxService {
  final storage = new FlutterSecureStorage();

  Screen1Service screen1service = Get.put(Screen1Service());

  Rx<TextEditingController> tempSetController =
      TextEditingController(text: '').obs;
  Rx<TextEditingController> timeSterSetController =
      TextEditingController(text: '').obs;
  Rx<TextEditingController> timeDrySetController =
      TextEditingController(text: '').obs;

  //read/write data program
  //write====================
  Future<void> writeDataProgram() async {
    List<dynamic> values = [
      screen1service.program.value,
      screen1service.program_name.value,
      screen1service.temp_set.value.toString(),
      screen1service.ster_time_set.value.toString(),
      screen1service.dry_time_set.value.toString(),
      screen1service.press_set.value.toString(),
    ];
    for (int i = 0; i < values.length; i++) {
      await storage.write(
        key: screen1service.keyProgram[i],
        value: values[i],
        aOptions: screen1service.getAndroidOptions(),
      );
    }
    readDataProgram();
  }

  // read=====================================
  Future<void> readDataProgram() async {
    for (int i = 0; i < screen1service.keyProgram.length; i++) {
      screen1service.mapProgram[screen1service.keyProgram[i]] =
          await storage.read(
        key: screen1service.keyProgram[i],
        aOptions: screen1service.getAndroidOptions(),
      );
    }
  }

  //hàm nhập thông số chương trình
  Future<void> parameter_program(double font_size, String program, String title,
      double temp_set, double ster_time_set, int dry_time_set) async {
    String? tempSetStorage = (await storage.read(
            key: 'tempSet_$program', aOptions: _getAndroidOptions()))
        .toString();
    String? timeSterSetStorage = (await storage.read(
            key: 'timeSterSet_$program', aOptions: _getAndroidOptions()))
        .toString();
    String? timeDrySetStorage = (await storage.read(
            key: 'timeDrySet_$program', aOptions: _getAndroidOptions()))
        .toString();

    if (tempSetStorage == 'null' ||
        timeSterSetStorage == 'null' ||
        timeDrySetStorage == 'null') {
      screen1service.font_size_program.value = font_size;
      screen1service.program_name.value = title;
      screen1service.program.value = program;
      screen1service.temp_set.value = temp_set;
      screen1service.ster_time_set.value = ster_time_set;
      screen1service.dry_time_set.value = dry_time_set;
      convertTandP();
    } else {
      screen1service.font_size_program.value = font_size;
      screen1service.program_name.value = title;
      screen1service.program.value = program;
      screen1service.temp_set.value = double.parse(tempSetStorage);
      screen1service.ster_time_set.value = double.parse(timeSterSetStorage);
      screen1service.dry_time_set.value = int.parse(timeDrySetStorage);
      convertTandP();
    }
  }

  Future<void> thayDoiThongSoChuongTrinh(String number, String tempSet,
      String timeSterSet, String timeDrySet) async {
    if (tempSet == '' || timeDrySet == '' || timeSterSet == '') {
      Fluttertoast.showToast(
          msg: 'Hãy nhập đẩy đủ thông số chương trình trước khi lưu',
          fontSize: 24 / screen1service.sizeDevice.value,
          gravity: ToastGravity.TOP);
    } else if (double.parse(tempSet) > 140.0 ||
        double.parse(tempSet) < 100.0 ||
        (double.parse(tempSet) % 1 > 0) ||
        double.parse(timeSterSet) < 1.0 ||
        double.parse(timeSterSet) > 9999.0 ||
        int.parse(timeDrySet) < 1 ||
        int.parse(timeDrySet) > 9999) {
      Fluttertoast.showToast(
          msg: 'Thông số chương trình nhập không hợp lệ',
          fontSize: 24 / screen1service.sizeDevice.value,
          gravity: ToastGravity.TOP);
    } else {
      try {
        await storage.delete(
            key: "tempSet_$number", aOptions: _getAndroidOptions());
        await storage.delete(
            key: "timeSterSet_$number", aOptions: _getAndroidOptions());
        await storage.delete(
            key: "timeDrySet_$number", aOptions: _getAndroidOptions());

        await storage.write(
            key: "tempSet_$number",
            value: tempSet,
            aOptions: _getAndroidOptions());
        await storage.write(
            key: "timeSterSet_$number",
            value: timeSterSet,
            aOptions: _getAndroidOptions());
        await storage.write(
            key: "timeDrySet_$number",
            value: timeDrySet,
            aOptions: _getAndroidOptions());

        tempSetController.value.text = '';
        timeSterSetController.value.text = '';
        timeDrySetController.value.text = '';

        Fluttertoast.showToast(
            msg: 'Thay đổi thông số chương trình ${number} thành công',
            fontSize: 24 / screen1service.sizeDevice.value,
            gravity: ToastGravity.TOP);
      } catch (e) {
        print('error=== $e');
        Fluttertoast.showToast(
            msg: 'Thay đổi không thành công. Hãy thử lại',
            fontSize: 24 / screen1service.sizeDevice.value,
            gravity: ToastGravity.TOP);
      }
    }
  }

  Future<void> convertTandP() async {
    if (screen1service.temp_set.value == 120.0)
      screen1service.press_set.value = 1.00;
    if (screen1service.temp_set.value == 121.0)
      screen1service.press_set.value = 1.06;
    if (screen1service.temp_set.value == 122.0)
      screen1service.press_set.value = 1.12;
    if (screen1service.temp_set.value == 123.0)
      screen1service.press_set.value = 1.19;
    if (screen1service.temp_set.value == 124.0)
      screen1service.press_set.value = 1.26;
    if (screen1service.temp_set.value == 125.0)
      screen1service.press_set.value = 1.333;
    if (screen1service.temp_set.value == 126.0)
      screen1service.press_set.value = 1.41;
    if (screen1service.temp_set.value == 127.0)
      screen1service.press_set.value = 1.48;
    if (screen1service.temp_set.value == 128.0)
      screen1service.press_set.value = 1.56;
    if (screen1service.temp_set.value == 129.0)
      screen1service.press_set.value = 1.64;
    if (screen1service.temp_set.value == 130.0)
      screen1service.press_set.value = 1.72;
    if (screen1service.temp_set.value == 131.0)
      screen1service.press_set.value = 1.8036;
    if (screen1service.temp_set.value == 132.0)
      screen1service.press_set.value = 1.89;
    if (screen1service.temp_set.value == 133.0)
      screen1service.press_set.value = 1.976;
    if (screen1service.temp_set.value == 134.0)
      screen1service.press_set.value = 2.066;
    if (screen1service.temp_set.value == 135.0)
      screen1service.press_set.value = 2.158;
    if (screen1service.temp_set.value == 136.0)
      screen1service.press_set.value = 2.252;
    if (screen1service.temp_set.value == 137.0)
      screen1service.press_set.value = 2.348;
    if (screen1service.temp_set.value == 138.0)
      screen1service.press_set.value = 2.446;
    if (screen1service.temp_set.value == 139.0)
      screen1service.press_set.value = 2.5469;
    if (screen1service.temp_set.value == 140.0)
      screen1service.press_set.value = 2.65;
    if (screen1service.temp_set.value < 120)
      screen1service.press_set.value = 0.9;
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
