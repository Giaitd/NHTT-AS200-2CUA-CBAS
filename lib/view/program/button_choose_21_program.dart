import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/services/program_service.dart';

import '../../helper/language.dart';
import '../../services/screen1_service.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../popup_screen/popup_screen.dart';

class ButtonChoose21Program extends StatefulWidget {
  const ButtonChoose21Program({Key? key}) : super(key: key);

  @override
  State<ButtonChoose21Program> createState() => _ButtonChoose21ProgramState();
}

class _ButtonChoose21ProgramState extends State<ButtonChoose21Program> {
  Screen1Service screen1service = Get.put(Screen1Service());
  ProgramService programService = Get.put(ProgramService());

  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;

    return Obx(
      () => Container(
        width: 1000 / sizeDevice,
        height: 700 / sizeDevice,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 250 / sizeDevice,
                  height: 575 / sizeDevice,
                  child: Container(
                    height: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 200 / sizeDevice,
                      maxHeight: 200 / sizeDevice,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20 / sizeDevice, 20 / sizeDevice, 0, 20 / sizeDevice),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '01', '01', 105, 60, 10);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 01',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '01')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '05', '05', 120, 35, 10);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 05',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '05')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '09', '09', 124, 24, 10);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 09',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '09')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '13', '13', 128, 18, 8);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 13',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '13')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '17', '17', 132, 15, 5);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 17',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '17')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 250 / sizeDevice,
                  height: 575 / sizeDevice,
                  child: Container(
                    height: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 200 / sizeDevice,
                      maxHeight: 200 / sizeDevice,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20 / sizeDevice, 20 / sizeDevice, 0, 20 / sizeDevice),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '02', '02', 110, 50, 10);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 02',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '02')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '06', '06', 121, 30, 10);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 06',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '06')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '10', '10', 125, 23, 10);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 10',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '10')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '14', '14', 129, 17, 8);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 14',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '14')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '18', '18', 134, 10, 5);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 18',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '18')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 250 / sizeDevice,
                  height: 575 / sizeDevice,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 580 / sizeDevice,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20 / sizeDevice, 20 / sizeDevice, 0, 20 / sizeDevice),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '03', '03', 115, 45, 10);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 03',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '03')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '07', '07', 122, 27, 10);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 07',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '07')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '11', '11', 126, 21, 8);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 11',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '11')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '15', '15', 130, 16, 8);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 15',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '15')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '19', '19', 134, 18, 20);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 19',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '19')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 250 / sizeDevice,
                  height: 575 / sizeDevice,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 280 / sizeDevice,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20 / sizeDevice,
                          20 / sizeDevice, 20 / sizeDevice, 20 / sizeDevice),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '04', '04', 118, 40, 10);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 04',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '04')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '08', '08', 123, 25, 10);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 08',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '08')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '12', '12', 127, 18, 5);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 12',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '12')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '16', '16', 131, 15, 8);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 16',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '16')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 17 / sizeDevice, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                programService.parameter_program(
                                    50.0, '20', '20', 135, 6, 6);
                                programService.writeDataProgram();
                              },
                              text: languageText(context, 'program_8') + ' 20',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color:
                                    (screen1service.mapProgram["programName"] ==
                                            '20')
                                        ? Color.fromARGB(255, 0, 143, 7)
                                        : Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white,
                                      fontSize: 22 / sizeDevice,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20 / sizeDevice,
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
            Row(
              children: [
                Container(
                  width: 250 / sizeDevice,
                  height: 90 / sizeDevice,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        20 / sizeDevice, 0, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () {
                        programService.parameter_program(
                            50.0, '21', '21', 136, 5, 5);
                        programService.writeDataProgram();
                      },
                      text: languageText(context, 'program_8') + ' 21',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 90 / sizeDevice,
                        color:
                            (screen1service.mapProgram["programName"] == '21')
                                ? Color.fromARGB(255, 0, 143, 7)
                                : Color(0xFF73A1E0),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Roboto Mono',
                                  color: Colors.white,
                                  fontSize: 22 / sizeDevice,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 5,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 20 / sizeDevice,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20 / sizeDevice, 0, 0, 0),
                  child: Container(
                    width: 710 / sizeDevice,
                    height: 90 / sizeDevice,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: FFButtonWidget(
                      onPressed: () {
                        PopupScreen().createUserProgram(context);
                        // Get.to(TuychonWidget());
                      },
                      text: languageText(
                          context, 'program_7'), //CHƯƠNG TRÌNH TÙY CHỌN
                      options: FFButtonOptions(
                        width: 130 / sizeDevice,
                        height: 40 / sizeDevice,
                        color:
                            (screen1service.mapProgram["programName"] == 'User')
                                ? Color.fromARGB(255, 0, 143, 7)
                                : Color(0xFF73A1E0),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Roboto Mono',
                                  color: Colors.white,
                                  fontSize: 22 / sizeDevice,
                                  fontWeight: FontWeight.normal,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 20 / sizeDevice,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
