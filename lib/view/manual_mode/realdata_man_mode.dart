import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helper/language.dart';
import '../../services/screen1_service.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class RealdataManualMode extends StatefulWidget {
  const RealdataManualMode({Key? key}) : super(key: key);

  @override
  State<RealdataManualMode> createState() => _RealdataManualModeState();
}

class _RealdataManualModeState extends State<RealdataManualMode> {
  Screen1Service screen1service = Get.put(Screen1Service());

  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;

    return Obx(
      () => Container(
        width: 350 / sizeDevice,
        height: 660 / sizeDevice,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Color(0xFF9E9E9E),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: 350 / sizeDevice,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20 / sizeDevice)),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                10 / sizeDevice, 20 / sizeDevice, 10 / sizeDevice, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    // 'Giá trị thực đo được trong buồng hấp',
                    languageText(context, 'man_mode_8'),
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Roboto Mono',
                          color: Colors.black,
                          fontSize: 20 / sizeDevice,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Container(
                  height: 50 / sizeDevice,
                  color: Colors.white,
                ),
                Container(
                  height: 160 / sizeDevice,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8 / sizeDevice),
                    border: Border.all(
                      color: Color(0xFFF1F4F8),
                      width: 2 / sizeDevice,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12 / sizeDevice,
                        8 / sizeDevice, 12 / sizeDevice, 8 / sizeDevice),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  8 / screen1service.sizeDevice.value),
                              child: Image.asset(
                                'assets/images/temperature_icon.png',
                                width: 40 / sizeDevice,
                                height: 40 / sizeDevice,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: 10 / screen1service.sizeDevice.value,
                            ),
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
                                12 / screen1service.sizeDevice.value, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 250 / screen1service.sizeDevice.value,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20 / sizeDevice, 0, 10 / sizeDevice, 0),
                                    child: Text(
                                      '${screen1service.temp.value}',
                                      style: TextStyle(
                                          fontFamily: 'Roboto Mono',
                                          fontSize: 75 / sizeDevice),
                                    ),
                                  ),
                                ),
                                Text(
                                  'oC',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                          fontFamily: 'Roboto Mono',
                                          fontSize: 20 / sizeDevice,
                                          fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //áp suất
                Container(
                  height: 50 / sizeDevice,
                  color: Colors.white,
                ),
                Container(
                  height: 160 / sizeDevice,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8 / sizeDevice),
                    border: Border.all(
                      color: Color(0xFFF1F4F8),
                      width: 2 / sizeDevice,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12 / sizeDevice,
                        8 / sizeDevice, 12 / sizeDevice, 8 / sizeDevice),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  8 / screen1service.sizeDevice.value),
                              child: Image.asset(
                                'assets/images/pressure-gauge-icon.png',
                                width: 40 / sizeDevice,
                                height: 40 / sizeDevice,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: 10 / screen1service.sizeDevice.value,
                            ),
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
                                12 / screen1service.sizeDevice.value, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 200 / screen1service.sizeDevice.value,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10 / sizeDevice, 0, 10 / sizeDevice, 0),
                                    child: Text(
                                      '${screen1service.press.value}',
                                      style: TextStyle(
                                          fontFamily: 'Roboto Mono',
                                          fontSize: 75 / sizeDevice),
                                    ),
                                  ),
                                ),
                                Text(
                                  'kgf/cm2',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                          fontFamily: 'Roboto Mono',
                                          fontSize: 20 / sizeDevice,
                                          fontWeight: FontWeight.w500),
                                ),
                              ],
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
    );
  }
}
