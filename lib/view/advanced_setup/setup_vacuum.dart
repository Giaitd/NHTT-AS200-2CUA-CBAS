import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/language.dart';
import '../../services/screen1_service.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../popup_screen/popup_screen.dart';

class SetupVacuumWidget extends StatefulWidget {
  const SetupVacuumWidget({Key? key}) : super(key: key);

  @override
  State<SetupVacuumWidget> createState() => _SetupVacuumWidgetState();
}

class _SetupVacuumWidgetState extends State<SetupVacuumWidget> {
  Screen1Service screen1service = Get.put(Screen1Service());
  String _pressHck_set = '';
  String _soLanHck_set = '';

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
                    'assets/images/pump_icon.png',
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
                    // 'Cài đặt máy hút chân không',
                    languageText(context, 'advanced_setup_6'),
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Roboto Mono',
                          color: Color(0xFF0F1113),
                          fontSize: 24 / sizeDevice,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              //số lần HCK
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12 / sizeDevice, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // 'Số lần hút chân không',
                                languageText(context, 'advanced_setup_8'),
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
                                  '(1 -> 6)',
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
                                    width: 200 / sizeDevice,
                                    child: TextFormField(
                                      enabled:
                                          screen1service.number_status.value ==
                                                  1
                                              ? false
                                              : true,
                                      onChanged: (Text) => {
                                        _soLanHck_set = Text,
                                        if (double.parse(_soLanHck_set) < 1 ||
                                            double.parse(_soLanHck_set) > 6 ||
                                            double.parse(_soLanHck_set) % 1 > 0)
                                          {
                                            PopupScreen().anoun_Dialog(context),
                                          }
                                        else
                                          {
                                            screen1service
                                                    .numberVacuum_set.value =
                                                int.parse(_soLanHck_set)
                                          },
                                        screen1service.writeDataSetup(1),
                                      },
                                      decoration: InputDecoration(
                                        hintText:
                                            '${screen1service.mapSetup["numberVacuum"]}',
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
                                        20 / sizeDevice, 0, 0, 0),
                                    child: Text(
                                      // 'lần',
                                      languageText(context, 'advanced_setup_9'),
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
                      ],
                    ),
                  ),
                ),
              ),
              //áp suất HCK
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
                                  // 'Áp suất hút chân không',
                                  languageText(context, 'advanced_setup_7'),
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
                                    '(-0.9 -> -0.1)',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF57636C),
                                          fontSize: 14,
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
                                        enabled: screen1service
                                                    .number_status.value ==
                                                1
                                            ? false
                                            : true,
                                        onChanged: (Text) => {
                                          _pressHck_set = Text,
                                          Future.delayed(Duration(seconds: 2),
                                              () {
                                            if (double.parse(_pressHck_set) <
                                                    -0.9 ||
                                                double.parse(_pressHck_set) >
                                                    -0.3) {
                                              PopupScreen()
                                                  .anoun_Dialog(context);
                                            } else {
                                              screen1service
                                                      .pressVacuum_set.value =
                                                  double.parse(_pressHck_set);
                                              screen1service.writeDataSetup(2);
                                            }
                                          })
                                        },
                                        decoration: InputDecoration(
                                          hintText:
                                              '${screen1service.mapSetup["pressVacuum"]}',
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
                                      "kgf/cm2",
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
