import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/language.dart';
import '../../services/screen1_service.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../popup_screen/popup_screen.dart';

class SetupExhaustWidget extends StatefulWidget {
  const SetupExhaustWidget({Key? key}) : super(key: key);

  @override
  State<SetupExhaustWidget> createState() => _SetupExhaustWidgetState();
}

class _SetupExhaustWidgetState extends State<SetupExhaustWidget> {
  Screen1Service screen1service = Get.put(Screen1Service());

  String _time_exhaust = '';
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
                    'assets/images/valve.png',
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
                    languageText(context, 'advanced_setup_11'),
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Roboto Mono',
                          color: Color(0xFF0F1113),
                          fontSize: 24 / sizeDevice,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              //Time exhaust setup
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
                                // thời gian mở xả nhanh
                                languageText(context, 'advanced_setup_12'),
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
                                  '(1 -> 10)',
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
                                    child: TextFormField(
                                      enabled:
                                          screen1service.number_status.value ==
                                                  1
                                              ? false
                                              : true,
                                      onChanged: (Text) => {
                                        _time_exhaust = Text,
                                        if (int.parse(_time_exhaust) < 1 ||
                                            int.parse(_time_exhaust) > 11)
                                          {PopupScreen().anoun_Dialog(context)}
                                        else
                                          {
                                            screen1service
                                                    .timeExhaust_set.value =
                                                int.parse(_time_exhaust)
                                          },
                                        screen1service.writeDataSetup(6),
                                      },
                                      decoration: InputDecoration(
                                        hintText:
                                            '${screen1service.mapSetup["timeExhaust"]}',
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
                                    languageText(context, 'advanced_setup_10'),
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
            ],
          ),
        ),
      ),
    );
  }
}
