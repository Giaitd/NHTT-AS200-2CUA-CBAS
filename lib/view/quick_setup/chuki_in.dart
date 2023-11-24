import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helper/language.dart';
import '../../services/screen1_service.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../popup_screen/popup_screen.dart';

class ChukiInWidget extends StatefulWidget {
  const ChukiInWidget({Key? key}) : super(key: key);

  @override
  State<ChukiInWidget> createState() => _ChukiInWidgetState();
}

class _ChukiInWidgetState extends State<ChukiInWidget> {
  Screen1Service screen1service = Get.put(Screen1Service());
  String _chukiin = '';

  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;
    return Obx(() => Container(
          child: Padding(
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
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0, 1 / sizeDevice, 1 / sizeDevice, 1 / sizeDevice),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(6 / sizeDevice),
                          child: Image.asset(
                            'assets/images/printer.png',
                            height: 80 / sizeDevice,
                            fit: BoxFit.fitHeight,
                          )),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            8 / sizeDevice, 4 / sizeDevice, 4 / sizeDevice, 0),
                        child: Text(
                          languageText(context, 'quick_setup_4'),
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Roboto Mono',
                                color: Color(0xFF0F1113),
                                fontSize: 24 / sizeDevice,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ),
                    Container(
                      width: 200 / sizeDevice,
                      height: 90 / sizeDevice,
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
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12 / sizeDevice, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        onChanged: (Text) async => {
                                          _chukiin = Text,
                                          if (_chukiin == '' ||
                                              double.parse(_chukiin) % 1 > 0 ||
                                              double.parse(_chukiin) < 1 ||
                                              double.parse(_chukiin) > 180)
                                            {
                                              PopupScreen()
                                                  .anoun_Dialog(context),
                                            }
                                          else
                                            {
                                              screen1service.cycle_printer
                                                  .value = int.parse(_chukiin),
                                              await screen1service
                                                  .writeDataSetup(4),
                                              Future.delayed(
                                                  Duration(seconds: 1), () {
                                                screen1service
                                                    .sendCyclePrinter();
                                              }),
                                            },
                                          // screen1service.writeDataSetup(4)
                                        },
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText:
                                              '${screen1service.mapSetup["cyclePrinter"]}',
                                          enabledBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Roboto Mono',
                                              color: Colors.black,
                                              fontSize: 25 / sizeDevice,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    Text(
                                      // 'giây',
                                      languageText(context, 'sec'),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 18 / sizeDevice,
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
