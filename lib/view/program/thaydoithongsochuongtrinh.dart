import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/other_widget/simple_button.dart';
import 'package:iotsupperapp/services/program_service.dart';
import 'package:iotsupperapp/view/program/nhapthongsothaydoi.dart';
import '../../helper/language.dart';
import '../../other_widget/appbar_back.dart';
import '../../services/screen1_service.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class ThayDoiThongSoChuongTrinh extends StatefulWidget {
  const ThayDoiThongSoChuongTrinh({Key? key}) : super(key: key);

  @override
  State<ThayDoiThongSoChuongTrinh> createState() =>
      _ThayDoiThongSoChuongTrinhState();
}

class _ThayDoiThongSoChuongTrinhState extends State<ThayDoiThongSoChuongTrinh> {
  Screen1Service screen1service = Get.put(Screen1Service());
  ProgramService programService = Get.put(ProgramService());

  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarBack(
          context,
          title: languageText(context, "title_1"),
          callBack: () {
            Navigator.pop(context);
          },
          isGetBack: true,
        ),
        body: Row(
          children: [
            //nhập thông số thay đổi
            NhapThongSoCTThayDoi(),

            //lưu vào chương trình
            Container(
              width: 980 / sizeDevice,
              height: 700 / sizeDevice,
              child: SingleChildScrollView(
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
                                  20 / sizeDevice,
                                  20 / sizeDevice,
                                  0,
                                  20 / sizeDevice),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  //CT1
                                  programButton(
                                    context,
                                    btnName:
                                        languageText(context, 'program_10') +
                                            ' 01',
                                    active: false,
                                    function: () async {
                                      await programService
                                          .thayDoiThongSoChuongTrinh(
                                              '01',
                                              programService
                                                  .tempSetController.value.text,
                                              programService
                                                  .timeSterSetController
                                                  .value
                                                  .text,
                                              programService
                                                  .timeDrySetController
                                                  .value
                                                  .text);
                                    },
                                  ),

                                  //CT4
                                  programButton(
                                    context,
                                    btnName:
                                        languageText(context, 'program_10') +
                                            ' 04',
                                    active: false,
                                    function: () async {
                                      await programService
                                          .thayDoiThongSoChuongTrinh(
                                              '04',
                                              programService
                                                  .tempSetController.value.text,
                                              programService
                                                  .timeSterSetController
                                                  .value
                                                  .text,
                                              programService
                                                  .timeDrySetController
                                                  .value
                                                  .text);
                                    },
                                  ),

                                  //CT7
                                  programButton(
                                    context,
                                    btnName:
                                        languageText(context, 'program_10') +
                                            ' 07',
                                    active: false,
                                    function: () async {
                                      await programService
                                          .thayDoiThongSoChuongTrinh(
                                              '07',
                                              programService
                                                  .tempSetController.value.text,
                                              programService
                                                  .timeSterSetController
                                                  .value
                                                  .text,
                                              programService
                                                  .timeDrySetController
                                                  .value
                                                  .text);
                                    },
                                  ),

                                  //CT10
                                  programButton(
                                    context,
                                    btnName:
                                        languageText(context, 'program_10') +
                                            ' 10',
                                    active: false,
                                    function: () async {
                                      await programService
                                          .thayDoiThongSoChuongTrinh(
                                              '10',
                                              programService
                                                  .tempSetController.value.text,
                                              programService
                                                  .timeSterSetController
                                                  .value
                                                  .text,
                                              programService
                                                  .timeDrySetController
                                                  .value
                                                  .text);
                                    },
                                  ),

                                  //CT13
                                  programButton(
                                    context,
                                    btnName:
                                        languageText(context, 'program_10') +
                                            ' 13',
                                    active: false,
                                    function: () async {
                                      await programService
                                          .thayDoiThongSoChuongTrinh(
                                              '13',
                                              programService
                                                  .tempSetController.value.text,
                                              programService
                                                  .timeSterSetController
                                                  .value
                                                  .text,
                                              programService
                                                  .timeDrySetController
                                                  .value
                                                  .text);
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
                                  20 / sizeDevice,
                                  20 / sizeDevice,
                                  0,
                                  20 / sizeDevice),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  //CT2
                                  programButton(
                                    context,
                                    btnName:
                                        languageText(context, 'program_10') +
                                            ' 02',
                                    active: false,
                                    function: () async {
                                      await programService
                                          .thayDoiThongSoChuongTrinh(
                                              '02',
                                              programService
                                                  .tempSetController.value.text,
                                              programService
                                                  .timeSterSetController
                                                  .value
                                                  .text,
                                              programService
                                                  .timeDrySetController
                                                  .value
                                                  .text);
                                    },
                                  ),

                                  //CT5
                                  programButton(
                                    context,
                                    btnName:
                                        languageText(context, 'program_10') +
                                            ' 05',
                                    active: false,
                                    function: () async {
                                      await programService
                                          .thayDoiThongSoChuongTrinh(
                                              '05',
                                              programService
                                                  .tempSetController.value.text,
                                              programService
                                                  .timeSterSetController
                                                  .value
                                                  .text,
                                              programService
                                                  .timeDrySetController
                                                  .value
                                                  .text);
                                    },
                                  ),

                                  //CT8
                                  programButton(
                                    context,
                                    btnName:
                                        languageText(context, 'program_10') +
                                            ' 08',
                                    active: false,
                                    function: () async {
                                      await programService
                                          .thayDoiThongSoChuongTrinh(
                                              '08',
                                              programService
                                                  .tempSetController.value.text,
                                              programService
                                                  .timeSterSetController
                                                  .value
                                                  .text,
                                              programService
                                                  .timeDrySetController
                                                  .value
                                                  .text);
                                    },
                                  ),

                                  //CT11
                                  programButton(
                                    context,
                                    btnName:
                                        languageText(context, 'program_10') +
                                            ' 11',
                                    active: false,
                                    function: () async {
                                      await programService
                                          .thayDoiThongSoChuongTrinh(
                                              '11',
                                              programService
                                                  .tempSetController.value.text,
                                              programService
                                                  .timeSterSetController
                                                  .value
                                                  .text,
                                              programService
                                                  .timeDrySetController
                                                  .value
                                                  .text);
                                    },
                                  ),

                                  //CT14
                                  programButton(
                                    context,
                                    btnName:
                                        languageText(context, 'program_10') +
                                            ' 14',
                                    active: false,
                                    function: () async {
                                      await programService
                                          .thayDoiThongSoChuongTrinh(
                                              '14',
                                              programService
                                                  .tempSetController.value.text,
                                              programService
                                                  .timeSterSetController
                                                  .value
                                                  .text,
                                              programService
                                                  .timeDrySetController
                                                  .value
                                                  .text);
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
                                  20 / sizeDevice,
                                  20 / sizeDevice,
                                  0,
                                  20 / sizeDevice),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  //CT1
                                  programButton(
                                    context,
                                    btnName:
                                        languageText(context, 'program_10') +
                                            ' 03',
                                    active: false,
                                    function: () async {
                                      await programService
                                          .thayDoiThongSoChuongTrinh(
                                              '03',
                                              programService
                                                  .tempSetController.value.text,
                                              programService
                                                  .timeSterSetController
                                                  .value
                                                  .text,
                                              programService
                                                  .timeDrySetController
                                                  .value
                                                  .text);
                                    },
                                  ),

                                  //CT6
                                  programButton(
                                    context,
                                    btnName:
                                        languageText(context, 'program_10') +
                                            ' 06',
                                    active: false,
                                    function: () async {
                                      await programService
                                          .thayDoiThongSoChuongTrinh(
                                              '06',
                                              programService
                                                  .tempSetController.value.text,
                                              programService
                                                  .timeSterSetController
                                                  .value
                                                  .text,
                                              programService
                                                  .timeDrySetController
                                                  .value
                                                  .text);
                                    },
                                  ),

                                  //CT9
                                  programButton(
                                    context,
                                    btnName:
                                        languageText(context, 'program_10') +
                                            ' 09',
                                    active: false,
                                    function: () async {
                                      await programService
                                          .thayDoiThongSoChuongTrinh(
                                              '09',
                                              programService
                                                  .tempSetController.value.text,
                                              programService
                                                  .timeSterSetController
                                                  .value
                                                  .text,
                                              programService
                                                  .timeDrySetController
                                                  .value
                                                  .text);
                                    },
                                  ),

                                  //CT12
                                  programButton(
                                    context,
                                    btnName:
                                        languageText(context, 'program_10') +
                                            ' 12',
                                    active: false,
                                    function: () async {
                                      await programService
                                          .thayDoiThongSoChuongTrinh(
                                              '12',
                                              programService
                                                  .tempSetController.value.text,
                                              programService
                                                  .timeSterSetController
                                                  .value
                                                  .text,
                                              programService
                                                  .timeDrySetController
                                                  .value
                                                  .text);
                                    },
                                  ),

                                  //CT15
                                  programButton(
                                    context,
                                    btnName:
                                        languageText(context, 'program_10') +
                                            ' 15',
                                    active: false,
                                    function: () async {
                                      await programService
                                          .thayDoiThongSoChuongTrinh(
                                              '15',
                                              programService
                                                  .tempSetController.value.text,
                                              programService
                                                  .timeSterSetController
                                                  .value
                                                  .text,
                                              programService
                                                  .timeDrySetController
                                                  .value
                                                  .text);
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
                                await programService.thayDoiThongSoChuongTrinh(
                                    '16',
                                    programService.tempSetController.value.text,
                                    programService
                                        .timeSterSetController.value.text,
                                    programService
                                        .timeDrySetController.value.text);
                              },
                              text:
                                  languageText(context, 'program_12') + ' TEST',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 90 / sizeDevice,
                                color: Color(0xFF73A1E0),
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
