import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/other_widget/simple_button.dart';
import 'package:iotsupperapp/services/program_service.dart';

import '../../helper/language.dart';
import '../../services/screen1_service.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../popup_screen/popup_screen.dart';

class ButtonChoose15Program extends StatefulWidget {
  const ButtonChoose15Program({Key? key}) : super(key: key);

  @override
  State<ButtonChoose15Program> createState() => _ButtonChoose15ProgramState();
}

class _ButtonChoose15ProgramState extends State<ButtonChoose15Program> {
  Screen1Service screen1service = Get.put(Screen1Service());
  ProgramService programService = Get.put(ProgramService());

  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;

    return Obx(
      () => Container(
        width: 980 / sizeDevice,
        height: 700 / sizeDevice,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 325 / sizeDevice,
                  height: 570 / sizeDevice,
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
                          //CT1
                          programButton(
                            context,
                            btnName: languageText(context, 'program_8') + ' 01',
                            active: screen1service.mapProgram["programName"] ==
                                '01',
                            function: () async {
                              await programService.parameter_program(
                                  50.0, '01', '01', 126, 50, 5);
                              await programService.writeDataProgram();
                            },
                          ),

                          //CT4
                          programButton(
                            context,
                            btnName: languageText(context, 'program_8') + ' 04',
                            active: screen1service.mapProgram["programName"] ==
                                '04',
                            function: () async {
                              await programService.parameter_program(
                                  50.0, '04', '04', 129, 46, 5);
                              await programService.writeDataProgram();
                            },
                          ),

                          //CT7
                          programButton(
                            context,
                            btnName: languageText(context, 'program_8') + ' 07',
                            active: screen1service.mapProgram["programName"] ==
                                '07',
                            function: () async {
                              await programService.parameter_program(
                                  50.0, '07', '07', 132, 43, 7);
                              await programService.writeDataProgram();
                            },
                          ),

                          //CT10
                          programButton(
                            context,
                            btnName: languageText(context, 'program_8') + ' 10',
                            active: screen1service.mapProgram["programName"] ==
                                '10',
                            function: () async {
                              await programService.parameter_program(
                                  50.0, '10', '10', 135, 40, 7);
                              await programService.writeDataProgram();
                            },
                          ),

                          //CT13
                          programButton(
                            context,
                            btnName: languageText(context, 'program_8') + ' 13',
                            active: screen1service.mapProgram["programName"] ==
                                '13',
                            function: () async {
                              await programService.parameter_program(
                                  50.0, '13', '13', 138, 37, 7);
                              await programService.writeDataProgram();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 325 / sizeDevice,
                  height: 570 / sizeDevice,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 570 / sizeDevice,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20 / sizeDevice, 20 / sizeDevice, 0, 20 / sizeDevice),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          //CT2
                          programButton(
                            context,
                            btnName: languageText(context, 'program_8') + ' 02',
                            active: screen1service.mapProgram["programName"] ==
                                '02',
                            function: () async {
                              await programService.parameter_program(
                                  50.0, '02', '02', 127, 48, 5);
                              await programService.writeDataProgram();
                            },
                          ),

                          //CT5
                          programButton(
                            context,
                            btnName: languageText(context, 'program_8') + ' 05',
                            active: screen1service.mapProgram["programName"] ==
                                '05',
                            function: () async {
                              await programService.parameter_program(
                                  50.0, '05', '05', 130, 45, 5);
                              await programService.writeDataProgram();
                            },
                          ),

                          //CT8
                          programButton(
                            context,
                            btnName: languageText(context, 'program_8') + ' 08',
                            active: screen1service.mapProgram["programName"] ==
                                '08',
                            function: () async {
                              await programService.parameter_program(
                                  50.0, '08', '08', 133, 42, 7);
                              await programService.writeDataProgram();
                            },
                          ),

                          //CT11
                          programButton(
                            context,
                            btnName: languageText(context, 'program_8') + ' 11',
                            active: screen1service.mapProgram["programName"] ==
                                '11',
                            function: () async {
                              await programService.parameter_program(
                                  50.0, '11', '11', 136, 39, 7);
                              await programService.writeDataProgram();
                            },
                          ),

                          //CT14
                          programButton(
                            context,
                            btnName: languageText(context, 'program_8') + ' 14',
                            active: screen1service.mapProgram["programName"] ==
                                '14',
                            function: () async {
                              await programService.parameter_program(
                                  50.0, '14', '14', 139, 36, 7);
                              await programService.writeDataProgram();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 325 / sizeDevice,
                  height: 570 / sizeDevice,
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
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20 / sizeDevice, 20 / sizeDevice, 0, 20 / sizeDevice),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          //CT3
                          programButton(
                            context,
                            btnName: languageText(context, 'program_8') + ' 03',
                            active: screen1service.mapProgram["programName"] ==
                                '03',
                            function: () async {
                              await programService.parameter_program(
                                  50.0, '03', '03', 128, 47, 5);
                              await programService.writeDataProgram();
                            },
                          ),

                          //CT6
                          programButton(
                            context,
                            btnName: languageText(context, 'program_8') + ' 06',
                            active: screen1service.mapProgram["programName"] ==
                                '06',
                            function: () async {
                              await programService.parameter_program(
                                  50.0, '06', '06', 131, 44, 5);
                              await programService.writeDataProgram();
                            },
                          ),

                          //CT9
                          programButton(
                            context,
                            btnName: languageText(context, 'program_8') + ' 09',
                            active: screen1service.mapProgram["programName"] ==
                                '09',
                            function: () async {
                              await programService.parameter_program(
                                  50.0, '09', '09', 134, 41, 7);
                              await programService.writeDataProgram();
                            },
                          ),

                          //CT12
                          programButton(
                            context,
                            btnName: languageText(context, 'program_8') + ' 12',
                            active: screen1service.mapProgram["programName"] ==
                                '12',
                            function: () async {
                              await programService.parameter_program(
                                  50.0, '12', '12', 137, 38, 7);
                              await programService.writeDataProgram();
                            },
                          ),

                          //CT15
                          programButton(
                            context,
                            btnName: languageText(context, 'program_8') + ' 15',
                            active: screen1service.mapProgram["programName"] ==
                                '15',
                            function: () async {
                              await programService.parameter_program(
                                  50.0, '15', '15', 140, 35, 7);
                              await programService.writeDataProgram();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 325 / sizeDevice,
                    height: 90 / sizeDevice,
                    padding: EdgeInsets.only(left: 20 / sizeDevice),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await programService.parameter_program(
                            50.0, '16', 'Test', 134, 3.5, 4);
                        await programService.writeDataProgram();
                      },
                      text: 'TEST',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 90 / sizeDevice,
                        color:
                            (screen1service.mapProgram["programName"] == '16')
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(20 / sizeDevice, 0, 0, 0),
                    child: Container(
                      // width: 870 / sizeDevice,
                      width: 630 / sizeDevice,
                      height: 90 / sizeDevice,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FFButtonWidget(
                        onPressed: () {
                          PopupScreen().createUserProgram(context);
                        },
                        text: languageText(
                            context, 'program_7'), //CHƯƠNG TRÌNH TÙY CHỌN
                        options: FFButtonOptions(
                          width: 130 / sizeDevice,
                          height: 40 / sizeDevice,
                          color: (screen1service.mapProgram["programName"] ==
                                  'User')
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
            ),
          ],
        ),
      ),
    );
  }
}
