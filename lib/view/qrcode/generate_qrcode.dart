import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/services/mqtt_service.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../helper/language.dart';
import '../../other_widget/appbar_back.dart';
import '../../services/screen1_service.dart';

class GenerateQRCode extends StatefulWidget {
  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  Screen1Service screen1service = Get.put(Screen1Service());

  MqttService mqttService = Get.put(MqttService());

  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;
    var a = {"deviceInfo": mqttService.androidBoxInfo.value};

    return Scaffold(
      backgroundColor: Color(0xFFF1F4F8),
      appBar: AppBarBack(context, title: languageText(context, 'title_8')),
      body: Container(
        height: 800 / sizeDevice,
        width: 1365 / sizeDevice,
        color: const Color(0xFFF0F0F0),
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.fromLTRB(0, 160 / sizeDevice, 0, 40 / sizeDevice),
              child: Text(
                'Quét mã QR này để lấy mã thiết bị',
                style: TextStyle(
                    fontSize: 25 / sizeDevice, fontWeight: FontWeight.w600),
              ),
            ),
            Center(
              child: QrImage(
                data: a.toString(),
                size: 222 / sizeDevice,
                version: QrVersions.auto,
                eyeStyle: const QrEyeStyle(
                    eyeShape: QrEyeShape.square, color: Colors.black),
                // embeddedImage: AssetImage(imagePath[0]),
                // embeddedImageStyle: QrEmbeddedImageStyle(
                //     size: Size(200 / sizeDevice, 200 / sizeDevice)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
