import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/screen1_service.dart';
import '../view/flutter_flow/flutter_flow_icon_button.dart';
import '../view/flutter_flow/flutter_flow_theme.dart';
import '../view/flutter_flow/flutter_flow_widgets.dart';

Screen1Service screen1service = Get.put(Screen1Service());

double sizeDevice = screen1service.sizeDevice.value;

manualButton(BuildContext context,
    {Function? function, String btnName = '', bool active = false}) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: 320 / sizeDevice,
      maxHeight: 200 / sizeDevice,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(0),
      shape: BoxShape.rectangle,
    ),
    padding:
        EdgeInsetsDirectional.fromSTEB(10 / sizeDevice, 0, 10 / sizeDevice, 0),
    child: FFButtonWidget(
      onPressed: () async {
        if (function != null) function();
      },
      text: btnName,
      options: FFButtonOptions(
        width: double.infinity,
        height: 110 / sizeDevice,
        color: active ? Colors.green : Color(0xFF73A1E0),
        textStyle: FlutterFlowTheme.of(context).subtitle2.override(
              fontFamily: 'Roboto Mono',
              color: Colors.white,
              fontSize: 24 / sizeDevice,
              fontWeight: FontWeight.normal,
            ),
        borderRadius: 20 / sizeDevice,
      ),
    ),
  );
}

programButton(BuildContext context,
    {Function? function, String btnName = '', bool active = false}) {
  return Padding(
    padding: EdgeInsetsDirectional.fromSTEB(0, 16 / sizeDevice, 0, 0),
    child: FFButtonWidget(
      onPressed: () async {
        if (function != null) function();
      },
      text: btnName,
      options: FFButtonOptions(
        width: double.infinity,
        height: 90 / sizeDevice,
        color: active ? Color.fromARGB(255, 0, 143, 7) : Color(0xFF73A1E0),
        textStyle: FlutterFlowTheme.of(context).subtitle2.override(
              fontFamily: 'Roboto Mono',
              color: Colors.white,
              fontSize: 22 / sizeDevice,
              fontWeight: FontWeight.normal,
            ),
        elevation: 5,
        borderRadius: 20 / sizeDevice,
      ),
    ),
  );
}

simpleIconButton(BuildContext context,
    {Function? function, IconData? icon, bool active = false}) {
  return FlutterFlowIconButton(
    borderColor: Color(0xFF9E9E9E),
    borderRadius: 120 / sizeDevice,
    borderWidth: 1,
    buttonSize: 120 / sizeDevice,
    fillColor: Color(0xFF73A1E0),
    icon: Icon(
      icon,
      color: FlutterFlowTheme.of(context).primaryColor,
      size: 100 / sizeDevice,
    ),
    onPressed: () async {
      if (function != null) function();
    },
  );
}
