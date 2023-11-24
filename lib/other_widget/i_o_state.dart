import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/screen1_service.dart';
import '../view/flutter_flow/flutter_flow_theme.dart';

Screen1Service screen1service = Get.put(Screen1Service());

double sizeDevice = screen1service.sizeDevice.value;

getIO_State(BuildContext context, String title, {bool value = false}) {
  return Container(
    padding: EdgeInsets.fromLTRB(10 / sizeDevice, 0, 10 / sizeDevice, 0),
    width: 630 / sizeDevice,
    height: 40 / sizeDevice,
    child: Row(children: [
      Container(
        margin: EdgeInsets.only(left: 5 / sizeDevice, right: 10 / sizeDevice),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: value == true ? Colors.green : Colors.white,
        ),
        width: 25 / sizeDevice,
        height: 25 / sizeDevice,
      ),
      Text(
        title,
        style: FlutterFlowTheme.of(context).subtitle2.override(
              fontFamily: 'Roboto Mono',
              color: Colors.black,
              fontSize: 20 / sizeDevice,
            ),
      )
    ]),
  );
}
