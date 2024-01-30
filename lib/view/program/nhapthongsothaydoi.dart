import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/services/program_service.dart';
import '../../helper/language.dart';
import '../../services/screen1_service.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class NhapThongSoCTThayDoi extends StatefulWidget {
  const NhapThongSoCTThayDoi({Key? key}) : super(key: key);

  @override
  State<NhapThongSoCTThayDoi> createState() => _NhapThongSoCTThayDoiState();
}

class _NhapThongSoCTThayDoiState extends State<NhapThongSoCTThayDoi> {
  Screen1Service screen1service = Get.put(Screen1Service());
  ProgramService programService = Get.put(ProgramService());

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0, 12 / sizeDevice, 0, 20 / sizeDevice),
                    child: Text(
                      // 'Nhập thông số chương trình thay đổi',
                      languageText(context, 'program_11'),
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
                                          child: TextFormField(
                                            // onChanged: (value) {},
                                            controller: programService
                                                .tempSetController.value,
                                            decoration: InputDecoration(
                                              hintText: '100 - 140',
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Roboto Mono',
                                                    color: Colors.grey,
                                                    fontSize: 18 / sizeDevice,
                                                  ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Roboto Mono',
                                                  color: Colors.black,
                                                  fontSize: 32 / sizeDevice,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            keyboardType: TextInputType.number,
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
                                          child: TextFormField(
                                            // onChanged: (value) {},
                                            controller: programService
                                                .timeSterSetController.value,
                                            decoration: InputDecoration(
                                              hintText: '1.0 - 9999.0',
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Roboto Mono',
                                                    color: Colors.grey,
                                                    fontSize: 18 / sizeDevice,
                                                  ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Roboto Mono',
                                                  color: Colors.black,
                                                  fontSize: 32 / sizeDevice,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            keyboardType: TextInputType.number,
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
                                          child: TextFormField(
                                            controller: programService
                                                .timeDrySetController.value,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: '1 - 9999',
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Roboto Mono',
                                                    color: Colors.grey,
                                                    fontSize: 18 / sizeDevice,
                                                  ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Roboto Mono',
                                                  color: Colors.black,
                                                  fontSize: 32 / sizeDevice,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            keyboardType: TextInputType.number,
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
      ),
    );
  }
}
