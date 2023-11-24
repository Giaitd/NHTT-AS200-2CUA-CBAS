import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/services/screen1_service.dart';
import '../../helper/language.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class ProgramChoosedWidget extends StatefulWidget {
  const ProgramChoosedWidget({Key? key}) : super(key: key);

  @override
  State<ProgramChoosedWidget> createState() => _ProgramChoosedWidgetState();
}

class _ProgramChoosedWidgetState extends State<ProgramChoosedWidget> {
  Screen1Service screen1service = Get.put(Screen1Service());

  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;
    return Obx(
      () => Container(
        width: 960 / sizeDevice,
        height: 370 / sizeDevice,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20 / sizeDevice),
          border: Border.all(
            color: Color(0xFF9E9E9E),
            width: 0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0, 2 / sizeDevice, 15 / sizeDevice, 0),
              child: Container(
                width: 900 / sizeDevice,
                height: 40 / sizeDevice,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0, 5 / sizeDevice, 10 / sizeDevice, 0),
                  child: Text(
                    // 'Thông số cài đặt',
                    languageText(context, 'main_1'),
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Roboto Mono',
                          color: Colors.black,
                          fontSize: 20 / sizeDevice,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20 / sizeDevice, 0, 0),
              child: Container(
                width: 945 / sizeDevice,
                height: 260 / sizeDevice,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 315 / sizeDevice,
                      height: 260 / sizeDevice,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/temperature_icon.png',
                            width: 60 / sizeDevice,
                            height: 60 / sizeDevice,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 15 / sizeDevice, 0, 0),
                            child: Text(
                              // 'Nhiệt độ tiệt trùng',
                              languageText(context, 'program_2'),
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Roboto Mono',
                                    color: Colors.black,
                                    fontSize: 20 / sizeDevice,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 15 / sizeDevice, 0, 0),
                            child: Container(
                              width: 200 / sizeDevice,
                              height: 100 / sizeDevice,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius:
                                    BorderRadius.circular(20 / sizeDevice),
                                border: Border.all(
                                  color: Color(0xFFF1F4F8),
                                  width: 2 / sizeDevice,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                        '${double.parse(screen1service.mapProgram["programTemp"]).toInt()}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Roboto Mono',
                                          fontSize: 70 / sizeDevice,
                                        )),
                                  ),
                                  Text(
                                    'oC',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          fontSize: 20 / sizeDevice,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 315 / sizeDevice,
                      height: 255 / sizeDevice,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/heating-icon.jpg',
                            width: 60 / sizeDevice,
                            height: 60 / sizeDevice,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 15 / sizeDevice, 0, 0),
                            child: Text(
                              // 'Thời gian tiệt trùng',
                              languageText(context, 'program_3'),
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Roboto Mono',
                                    color: Colors.black,
                                    fontSize: 20 / sizeDevice,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 15 / sizeDevice, 0, 0),
                            child: Container(
                              width: 200 / sizeDevice,
                              height: 100 / sizeDevice,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius:
                                    BorderRadius.circular(20 / sizeDevice),
                                border: Border.all(
                                  color: Color(0xFFF1F4F8),
                                  width: 2 / sizeDevice,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                        // '${screen1service.ster_time_set.value}',
                                        '${screen1service.mapProgram["programTimeSter"]}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Roboto Mono',
                                            fontSize: 70 / sizeDevice)),
                                  ),
                                  Text(
                                    // 'phút',
                                    languageText(context, 'min'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          fontSize: 20 / sizeDevice,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 315 / sizeDevice,
                      height: 250 / sizeDevice,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/clock_icon.png',
                            width: 60 / sizeDevice,
                            height: 60 / sizeDevice,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 15 / sizeDevice, 0, 0),
                            child: Text(
                              // 'Thời gian làm nguội',
                              languageText(context, 'program_4'),
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Roboto Mono',
                                    color: Colors.black,
                                    fontSize: 20 / sizeDevice,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 15 / sizeDevice, 0, 0),
                            child: Container(
                              width: 180 / sizeDevice,
                              height: 100 / sizeDevice,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius:
                                    BorderRadius.circular(20 / sizeDevice),
                                border: Border.all(
                                  color: Color(0xFFF1F4F8),
                                  width: 2 / sizeDevice,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                        // '${screen1service.dry_time_set.value}',
                                        '${screen1service.mapProgram["programTimeDry"]}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Roboto Mono',
                                            fontSize: 70 / sizeDevice)),
                                  ),
                                  Text(
                                    // 'Phút',
                                    languageText(context, 'min'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          fontSize: 20 / sizeDevice,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
