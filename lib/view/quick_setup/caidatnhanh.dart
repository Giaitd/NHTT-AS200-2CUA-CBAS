import 'package:iotsupperapp/language_providers/choose_language.dart';
import 'package:iotsupperapp/other_widget/appbar_back.dart';
import 'package:provider/provider.dart';
import '../../helper/language.dart';
import '../../language_providers/language_provider.dart';
import '../../language_providers/select_language.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/services/screen1_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'chuki_in.dart';

class CaidatnhanhWidget extends StatefulWidget {
  @override
  _CaidatnhanhWidgetState createState() => _CaidatnhanhWidgetState();
}

class _CaidatnhanhWidgetState extends State<CaidatnhanhWidget> {
  void setDropdownValue(SelectLanguageModel newValue) {
    final languageProvider =
        Provider.of<LanguageProvider>(context, listen: false);
    languageProvider.updateLanguage(newValue.locale);
  }

  Screen1Service screen1service = Get.put(Screen1Service());
  @override
  Widget build(BuildContext context) {
    final languageProvider =
        Provider.of<LanguageProvider>(context, listen: true);
    double sizeDevice = screen1service.sizeDevice.value;
    return Obx(
      () => Scaffold(
        backgroundColor: Color(0xFFF1F4F8),
        appBar: AppBarBack(context, title: languageText(context, 'title_11')),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0, 12 / sizeDevice, 0, 0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      //on/off máy in
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16 / sizeDevice, 0, 16 / sizeDevice, 8),
                        child: Container(
                          width: double.infinity,
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
                            padding: EdgeInsetsDirectional.all(8 / sizeDevice),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      1 / sizeDevice,
                                      1 / sizeDevice,
                                      1 / sizeDevice),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(6 / sizeDevice),
                                    child: Image.asset(
                                      'assets/images/printer.png',
                                      width: 80 / sizeDevice,
                                      height: 80 / sizeDevice,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8 / sizeDevice,
                                        4 / sizeDevice,
                                        4 / sizeDevice,
                                        0),
                                    child: Text(
                                      // 'Bật / Tắt máy in',
                                      languageText(context, 'quick_setup_2'),
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Roboto Mono',
                                            color: Color(0xFF0F1113),
                                            fontSize: 24 / sizeDevice,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 200 / sizeDevice,
                                      child: FlutterSwitch(
                                        width: 100.0 / sizeDevice,
                                        height: 50.0 / sizeDevice,
                                        valueFontSize: 25.0 / sizeDevice,
                                        toggleSize: 45.0 / sizeDevice,
                                        value: screen1service
                                                .mapSetup["printerOnOff"] ==
                                            'true',
                                        borderRadius: 20.0 / sizeDevice,
                                        padding: 8.0 / sizeDevice,
                                        showOnOff: true,
                                        onToggle: (val) {
                                          setState(() {
                                            screen1service
                                                    .mapSetup["printerOnOff"] =
                                                val.toString();
                                            screen1service.writeDataSetup(3);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //chu kì máy in =====================================================================
                      ChukiInWidget(),
                    ],
                  ),
                ),
                //thay đổi ngôn ngữ
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      16 / sizeDevice, 0, 16 / sizeDevice, 8 / sizeDevice),
                  child: Container(
                    width: double.infinity,
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
                      padding: EdgeInsetsDirectional.all(8 / sizeDevice),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0,
                                1 / sizeDevice, 1 / sizeDevice, 1 / sizeDevice),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(6 / sizeDevice),
                              child: Image.asset(
                                'assets/images/language_icon.png',
                                width: 80 / sizeDevice,
                                height: 80 / sizeDevice,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8 / sizeDevice,
                                  4 / sizeDevice,
                                  4 / sizeDevice,
                                  0),
                              child: Text(
                                // language,
                                languageText(context, 'quick_setup_0'),
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF0F1113),
                                      fontSize: 24 / sizeDevice,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                50 / sizeDevice, 0, 0, 0),
                            child: ChooseLanguageWidget(context,
                                setDropdownValue: setDropdownValue,
                                listDropdownValue:
                                    languageProvider.listDropdownValue,
                                dropdownValue: languageProvider.dropdownValue),
                          )
                        ],
                      ),
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
