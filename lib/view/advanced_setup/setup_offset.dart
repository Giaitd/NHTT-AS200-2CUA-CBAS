import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/language.dart';
import '../../services/screen1_service.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../popup_screen/popup_screen.dart';

class SetupOffsetWidget extends StatefulWidget {
  const SetupOffsetWidget({Key? key}) : super(key: key);

  @override
  State<SetupOffsetWidget> createState() => _SetupOffsetWidgetState();
}

class _SetupOffsetWidgetState extends State<SetupOffsetWidget> {
  Screen1Service screen1service = Get.put(Screen1Service());

  String _offset_T = '';
  String _offset_P = '';
  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          16 / sizeDevice, 0, 16 / sizeDevice, 8 / sizeDevice),
      child: Container(
        width: double.infinity,
        height: 150 / sizeDevice,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Color(0x411D2429),
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(8 / sizeDevice),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              8 / sizeDevice, 8 / sizeDevice, 8 / sizeDevice, 8 / sizeDevice),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0, 1 / sizeDevice, 1 / sizeDevice, 1 / sizeDevice),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6 / sizeDevice),
                  child: Image.asset(
                    'assets/images/setup_icon.png',
                    width: 80 / sizeDevice,
                    height: 80 / sizeDevice,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      8 / sizeDevice, 8 / sizeDevice, 4 / sizeDevice, 0),
                  child: Text(
                    // 'Cài đặt offset',
                    languageText(context, 'advanced_setup_2'),
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Roboto Mono',
                          color: Color(0xFF0F1113),
                          fontSize: 24 / sizeDevice,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              //offset T
              Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8 / sizeDevice),
                child: Container(
                  width: 350 / sizeDevice,
                  height: 130 / sizeDevice,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8 / sizeDevice),
                    border: Border.all(
                      color: Color(0xFFF1F4F8),
                      width: 2 / sizeDevice,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12 / sizeDevice,
                        8 / sizeDevice, 12 / sizeDevice, 8 / sizeDevice),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12 / sizeDevice, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // 'Offset nhiệt độ',
                                languageText(context, 'advanced_setup_4'),
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.black,
                                      fontSize: 16 / sizeDevice,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 4 / sizeDevice, 8 / sizeDevice, 0),
                                child: AutoSizeText(
                                  '(-5.0 -> 5.0)',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF57636C),
                                        fontSize: 14 / sizeDevice,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 225 / sizeDevice,
                                    child: TextField(
                                      onChanged: (Text) => {
                                        _offset_T = Text,
                                        if (double.parse(_offset_T) < -5 ||
                                            double.parse(_offset_T) > 5)
                                          {PopupScreen().anoun_Dialog(context)}
                                        else
                                          {
                                            screen1service.temp_offset.value =
                                                double.parse(_offset_T)
                                          },
                                        screen1service.writeDataSetup(0),
                                      },
                                      decoration: InputDecoration(
                                        hintText:
                                            '${screen1service.mapSetup["offsetT"]}',
                                        enabledBorder: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.number,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Roboto Mono',
                                            color: Colors.black,
                                            fontSize: 25 / sizeDevice,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'oC',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 16 / sizeDevice,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // offset P
              Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8 / sizeDevice),
                child: Container(
                  width: 350 / sizeDevice,
                  height: 130 / sizeDevice,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8 / sizeDevice),
                    border: Border.all(
                      color: Color(0xFFF1F4F8),
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12 / sizeDevice,
                        8 / sizeDevice, 12 / sizeDevice, 8 / sizeDevice),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12 / sizeDevice, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // 'Offset áp suất',
                                  languageText(context, 'advanced_setup_5'),
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Roboto Mono',
                                        color: Color(0xFF14181B),
                                        fontSize: 16 / sizeDevice,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4 / sizeDevice, 8 / sizeDevice, 0),
                                  child: AutoSizeText(
                                    '(-0.2 -> 0.2)',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF57636C),
                                          fontSize: 14 / sizeDevice,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 200 / sizeDevice,
                                      child: TextFormField(
                                        onChanged: (Text) => {
                                          _offset_P = Text,
                                          if (double.parse(_offset_P) < -0.2 ||
                                              double.parse(_offset_P) > 0.2)
                                            {
                                              PopupScreen()
                                                  .anoun_Dialog(context)
                                            }
                                          else
                                            {
                                              screen1service
                                                      .press_offset.value =
                                                  double.parse(_offset_P)
                                            },
                                          screen1service.writeDataSetup(7),
                                        },
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText:
                                              '${screen1service.mapSetup["offsetP"]}',
                                          enabledBorder: InputBorder.none,
                                        ),
                                        keyboardType: TextInputType.number,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Roboto Mono',
                                              color: Colors.black,
                                              fontSize: 25 / sizeDevice,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      child: Text(
                                        'kgf/cm2',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 16 / sizeDevice,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
