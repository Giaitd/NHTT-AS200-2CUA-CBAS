import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/services/screen1_service.dart';
import '../../helper/language.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class DataRealtimeWidget extends StatefulWidget {
  const DataRealtimeWidget({Key? key}) : super(key: key);

  @override
  State<DataRealtimeWidget> createState() => _DataRealtimeWidgetState();
}

class _DataRealtimeWidgetState extends State<DataRealtimeWidget> {
  Screen1Service screen1service = Get.put(Screen1Service());

  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;

    return Obx(
      () => Container(
        width: 350 / sizeDevice,
        height: 520 / sizeDevice,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20 / sizeDevice),
          border: Border.all(
            color: Color(0xFF9E9E9E),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10 / sizeDevice, 0, 0),
          child: Container(
            width: double.infinity,
            height: 400 / sizeDevice,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x25090F13),
                  offset: Offset(0, 2 / sizeDevice),
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(20 / sizeDevice)),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  15 / sizeDevice, 0, 10 / sizeDevice, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 'Buồng hấp',
                    languageText(context, 'main_2'),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Roboto Mono',
                          color: Colors.black,
                          fontSize: 20 / sizeDevice,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  ListView(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0, 28 / sizeDevice, 0, 8 / sizeDevice),
                        child: Container(
                          height: 160 / sizeDevice,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8 / sizeDevice),
                            border: Border.all(
                              color: Color(0xFFF1F4F8),
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12 / sizeDevice,
                                8 / sizeDevice,
                                12 / sizeDevice,
                                8 / sizeDevice),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      child: Image.asset(
                                        'assets/images/temperature_icon.png',
                                        width: 40 / sizeDevice,
                                        height: 40 / sizeDevice,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(width: 10 / sizeDevice),
                                    Text(
                                      // 'Nhiệt độ buồng hấp',
                                      languageText(context, 'main_3'),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Roboto Mono',
                                            color: Colors.black,
                                            fontSize: 20 / sizeDevice,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12 / sizeDevice, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 220 / sizeDevice,
                                          alignment: Alignment.center,
                                          child: Text(
                                              '${screen1service.temp.value}',
                                              style: TextStyle(
                                                fontFamily: 'Roboto Mono',
                                                fontSize: 75 / sizeDevice,
                                              )),
                                        ),
                                        Container(
                                          child: Text(
                                            'oC',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto Mono',
                                                  fontSize: 20 / sizeDevice,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0, 20 / sizeDevice, 0, 8 / sizeDevice),
                        child: Container(
                          height: 160 / sizeDevice,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8 / sizeDevice),
                            border: Border.all(
                              color: Color(0xFFF1F4F8),
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12 / sizeDevice,
                                8 / sizeDevice,
                                12 / sizeDevice,
                                8 / sizeDevice),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      child: Image.asset(
                                        'assets/images/pressure-gauge-icon.png',
                                        width: 40 / sizeDevice,
                                        height: 40 / sizeDevice,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(width: 10 / sizeDevice),
                                    Text(
                                      // 'áp suất buồng hấp',
                                      languageText(context, 'main_4'),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Roboto Mono',
                                            color: Colors.black,
                                            fontSize: 20 / sizeDevice,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12 / sizeDevice, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 195 / sizeDevice,
                                          alignment: Alignment.center,
                                          child: Text(
                                              '${screen1service.press.value}',
                                              style: TextStyle(
                                                fontFamily: 'Roboto Mono',
                                                fontSize: 75 / sizeDevice,
                                              )),
                                        ),
                                        Container(
                                          child: Text(
                                            'kgf/cm2',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto Mono',
                                                  fontSize: 20 / sizeDevice,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
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
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 30 / sizeDevice, 0, 0),
                        child: Container(
                          height: 60 / sizeDevice,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8 / sizeDevice),
                            border: Border.all(
                              color: Color(0xFFF1F4F8),
                              width: 2 / sizeDevice,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                // 'Số mẻ hấp hoàn thành:',
                                languageText(context, 'main_5'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      fontSize: 20 / sizeDevice,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Text(
                                '${screen1service.mapSetup["numberCycleCompleted"]}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      fontSize: 20 / sizeDevice,
                                      fontWeight: FontWeight.w500,
                                    ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
