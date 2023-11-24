import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helper/language.dart';
import '../../services/screen1_service.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class ParameterProgram extends StatefulWidget {
  const ParameterProgram({Key? key}) : super(key: key);

  @override
  State<ParameterProgram> createState() => _ParameterProgramState();
}

class _ParameterProgramState extends State<ParameterProgram> {
  Screen1Service screen1service = Get.put(Screen1Service());
  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;
    return Obx(
      () => Container(
        width: 370 / sizeDevice,
        height: 800 / sizeDevice,
        padding: EdgeInsets.fromLTRB(
            20 / sizeDevice, 20 / sizeDevice, 0, 20 / sizeDevice),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x25090F13),
                  offset: Offset(0, 2 / sizeDevice),
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(20 / sizeDevice))),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16 / sizeDevice,
                5 / sizeDevice, 16 / sizeDevice, 16 / sizeDevice),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0, 12 / sizeDevice, 0, 12 / sizeDevice),
                  child: Text(
                    // 'Thông số chương trình',
                    languageText(context, 'program_5'),
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Roboto Mono',
                          color: Colors.black,
                          fontSize: 22 / sizeDevice,
                          fontWeight: FontWeight.w500,
                        ),
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
                          0, 10 / sizeDevice, 0, 10 / sizeDevice),
                      child: Container(
                        width: double.infinity,
                        height: 120 / sizeDevice,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8 / sizeDevice),
                          border: Border.all(
                            color: Color(0xFFF1F4F8),
                            width: 2 / sizeDevice,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // 'Chương trình tiệt trùng',
                                languageText(context, 'program_1'),
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
                                    0, 4 / sizeDevice, 0, 0),
                                child: Container(
                                  width: 150 / sizeDevice,
                                  child: Text(
                                    '${screen1service.mapProgram["programName"]}',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          color: Colors.black,
                                          fontSize: 40 / sizeDevice,
                                          fontWeight: FontWeight.normal,
                                        ),
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
                          0, 10 / sizeDevice, 0, 10 / sizeDevice),
                      child: Container(
                        width: double.infinity,
                        height: 120 / sizeDevice,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8 / sizeDevice),
                          border: Border.all(
                            color: Color(0xFFF1F4F8),
                            width: 2 / sizeDevice,
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
                                    borderRadius:
                                        BorderRadius.circular(8 / sizeDevice),
                                    child: Image.asset(
                                      'assets/images/temperature_icon.png',
                                      width: 40 / sizeDevice,
                                      height: 40 / sizeDevice,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(width: 10 / sizeDevice),
                                  Text(
                                    // 'Nhiệt độ tiệt trùng',
                                    languageText(context, 'program_2'),
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          color: Colors.black,
                                          fontSize: 16 / sizeDevice,
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
                                        width: 150 / sizeDevice,
                                        child: Text(
                                          '${double.parse(screen1service.mapProgram["programTemp"])}',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Roboto Mono',
                                                color: Colors.black,
                                                fontSize: 40 / sizeDevice,
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0, 10 / sizeDevice, 0, 10 / sizeDevice),
                      child: Container(
                        width: double.infinity,
                        height: 120 / sizeDevice,
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
                                    borderRadius:
                                        BorderRadius.circular(8 / sizeDevice),
                                    child: Image.asset(
                                      'assets/images/heating-icon.jpg',
                                      width: 40 / sizeDevice,
                                      height: 40 / sizeDevice,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(width: 10 / sizeDevice),
                                  Text(
                                    // 'Thời gian tiệt trùng',
                                    languageText(context, 'program_3'),
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          color: Colors.black,
                                          fontSize: 16 / sizeDevice,
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
                                        width: 150 / sizeDevice,
                                        child: Text(
                                          // '${screen1service.ster_time_set.value}',
                                          '${double.parse(screen1service.mapProgram["programTimeSter"])}',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Roboto Mono',
                                                color: Colors.black,
                                                fontSize: 40 / sizeDevice,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        // 'phút',
                                        languageText(context, 'min'),
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0, 10 / sizeDevice, 0, 10 / sizeDevice),
                      child: Container(
                        width: double.infinity,
                        height: 120 / sizeDevice,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8 / sizeDevice),
                          border: Border.all(
                            color: Color(0xFFF1F4F8),
                            width: 2 / sizeDevice,
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
                                    borderRadius:
                                        BorderRadius.circular(8 / sizeDevice),
                                    child: Image.asset(
                                      'assets/images/clock_icon.png',
                                      width: 40 / sizeDevice,
                                      height: 40 / sizeDevice,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(width: 10 / sizeDevice),
                                  Text(
                                    // 'Thời gian sấy khô',
                                    languageText(context, 'program_4'),
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          color: Colors.black,
                                          fontSize: 16 / sizeDevice,
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
                                        width: 150 / sizeDevice,
                                        child: Text(
                                          // '${screen1service.dry_time_set.value}',
                                          '${int.parse(screen1service.mapProgram["programTimeDry"])}',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Roboto Mono',
                                                color: Colors.black,
                                                fontSize: 40 / sizeDevice,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        // 'phút',
                                        languageText(context, 'min'),
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
