import 'package:iotsupperapp/other_widget/appbar_back.dart';
import 'package:iotsupperapp/other_widget/i_o_state.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/services/screen1_service.dart';
import 'package:flutter/material.dart';

import '../../helper/language.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class TrangThaiIOWidget extends StatefulWidget {
  @override
  _TrangThaiIOWidgetState createState() => _TrangThaiIOWidgetState();
}

class _TrangThaiIOWidgetState extends State<TrangThaiIOWidget> {
  Screen1Service screen1service = Get.put(Screen1Service());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;

    return Obx(
      () => Scaffold(
        appBar: AppBarBack(context, title: languageText(context, "title_5")),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(20 / sizeDevice),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 660 / sizeDevice,
                child: Row(mainAxisSize: MainAxisSize.max, children: [
                  Container(
                    width: 650 / sizeDevice,
                    height: 660 / sizeDevice,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xFF9E9E9E),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              0, 10 / sizeDevice, 0, 10 / sizeDevice),
                          child: Text(
                            // 'Trạng thái đầu vào',
                            languageText(context, 'status_i_o_0'),
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Roboto Mono',
                                  color: Color(0xFF0F1113),
                                  fontSize: 22 / sizeDevice,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Container(
                          width: 600 / sizeDevice,
                          height: 1,
                          color: Colors.grey,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20 / sizeDevice,
                              20 / sizeDevice, 0, 20 / sizeDevice),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/temperature_icon.png',
                                width: 40 / sizeDevice,
                                height: 40 / sizeDevice,
                                fit: BoxFit.cover,
                              ),
                              Container(width: 5 / sizeDevice),
                              Text(
                                // 'Giá trị thực đo được trong buồng hấp',
                                languageText(context, 'main_3'),
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.black,
                                      fontSize: 20 / sizeDevice,
                                    ),
                              ),
                              Container(width: 20 / sizeDevice),
                              Text(
                                '${screen1service.temp.value}',
                                style: TextStyle(
                                    fontFamily: 'Roboto Mono',
                                    fontSize: 25 / sizeDevice,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(width: 20 / sizeDevice),
                              Text(
                                'oC',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                        fontFamily: 'Roboto Mono',
                                        color: Colors.black,
                                        fontSize: 20 / sizeDevice,
                                        fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              20 / sizeDevice, 0, 0, 20 / sizeDevice),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/pressure-gauge-icon.png',
                                width: 40 / sizeDevice,
                                height: 40 / sizeDevice,
                                fit: BoxFit.fitHeight,
                              ),
                              Container(width: 5 / sizeDevice),
                              Text(
                                // 'Giá trị thực đo được trong buồng hấp',
                                languageText(context, 'main_4'),
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.black,
                                      fontSize: 20 / sizeDevice,
                                    ),
                              ),
                              Container(width: 20 / sizeDevice),
                              Text(
                                '${screen1service.press.value}',
                                style: TextStyle(
                                    fontFamily: 'Roboto Mono',
                                    fontSize: 25 / sizeDevice,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(width: 20 / sizeDevice),
                              Text(
                                'kgf/cm2',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                        fontFamily: 'Roboto Mono',
                                        color: Colors.black,
                                        fontSize: 20 / sizeDevice,
                                        fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        getIO_State(context, languageText(context, 'di_0'),
                            value: screen1service.i0[0]),
                        getIO_State(context, languageText(context, 'di_1'),
                            value: screen1service.i0[1]),
                        getIO_State(context, languageText(context, 'di_2'),
                            value: screen1service.i0[2]),
                        getIO_State(context, languageText(context, 'di_3'),
                            value: screen1service.i0[3]),
                        getIO_State(context, languageText(context, 'di_4'),
                            value: screen1service.i0[4]),
                        getIO_State(context, languageText(context, 'di_5'),
                            value: screen1service.i0[5]),
                        getIO_State(context, languageText(context, 'di_6'),
                            value: screen1service.i0[6]),
                        getIO_State(context, languageText(context, 'di_7'),
                            value: screen1service.i0[7]),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20 / sizeDevice),
                    width: 650 / sizeDevice,
                    height: 660 / sizeDevice,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xFF9E9E9E),
                      ),
                    ),
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            0, 10 / sizeDevice, 0, 10 / sizeDevice),
                        child: Text(
                          // 'Trạng thái đầu ra',
                          languageText(context, 'status_i_o_1'),
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Roboto Mono',
                                color: Color(0xFF0F1113),
                                fontSize: 22 / sizeDevice,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20 / sizeDevice),
                        width: 600 / sizeDevice,
                        height: 1,
                        color: Colors.grey,
                      ),
                      getIO_State(context, languageText(context, 'do_6'),
                          value: screen1service.q0[6]),
                      getIO_State(context, languageText(context, 'do_0'),
                          value: screen1service.q0[0]),
                      getIO_State(context, languageText(context, 'do_1'),
                          value: screen1service.q0[1]),
                      getIO_State(context, languageText(context, 'do_3'),
                          value: screen1service.q0[3]),
                      getIO_State(context, languageText(context, 'do_2'),
                          value: screen1service.q0[2]),
                      getIO_State(context, languageText(context, 'do_9'),
                          value: screen1service.q1[1]),
                      getIO_State(context, languageText(context, 'do_5'),
                          value: screen1service.q0[5]),
                      getIO_State(context, languageText(context, 'do_7'),
                          value: screen1service.q0[7]),
                      getIO_State(context, languageText(context, 'do_8'),
                          value: screen1service.q1[0]),
                      getIO_State(context, languageText(context, 'do_4'),
                          value: screen1service.q0[4]),
                    ]),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
