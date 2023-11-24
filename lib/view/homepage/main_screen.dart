import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/helper/language.dart';
import 'package:iotsupperapp/other_widget/simple_button.dart';
import 'package:iotsupperapp/services/program_service.dart';
import 'package:iotsupperapp/services/screen1_service.dart';
import 'package:iotsupperapp/view/fault_screen/bangbaoloi.dart';
import 'package:iotsupperapp/view/popup_screen/popup_screen.dart';
import 'package:iotsupperapp/view/quick_setup/caidatnhanh.dart';
import 'package:iotsupperapp/view/homepage/temp_press_realtime.dart';
import '../advanced_setup/caidatchuyensau.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../program/chonchuongtrinh.dart';
import 'program_choosed.dart';
import 'package:iotsupperapp/helper/router.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Timer? _timer1;
  Timer? timerPubDuLieuMeHap;

  bool passwordVisibility = false;

  Screen1Service screen1service = Get.put(Screen1Service());
  ProgramService programService = Get.put(ProgramService());

  @override
  void initState() {
    super.initState();
    EasyLoading.dismiss();
    if (_timer1 != null) _timer1!.cancel();
    _timer1 = Timer.periodic(Duration(milliseconds: 500), (timer) {
      screen1service.convertData(context);
    });
    programService.readDataProgram();
    screen1service.readDataSetup();
  }

  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;
    return Obx(
      () => Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20 / sizeDevice, 10 / sizeDevice, 0, 0),
                      child: Container(
                        width: 1325 / sizeDevice,
                        height: 110 / sizeDevice,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(20 / sizeDevice),
                          border: Border.all(
                            color: Color(0xFF9E9E9E),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                if (screen1service.startStop == true) {
                                } else {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChonchuongtrinhWidget(),
                                    ),
                                  );
                                }
                              },
                              text:
                                  '${screen1service.mapProgram["programName"]}',
                              options: FFButtonOptions(
                                width: 130 / sizeDevice,
                                height: 110 / sizeDevice,
                                color: Color(0xFF73A1E0),
                                textStyle: TextStyle(
                                  fontFamily: 'Roboto Mono',
                                  fontSize:
                                      screen1service.font_size_program.value,
                                  color: Colors.black,
                                ),
                                elevation: 10,
                                borderSide: BorderSide(
                                  color: Color(0xFF9E9E9E),
                                  width: 0,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    50 / sizeDevice, 0, 0, 0),
                                child: Text(
                                  languageText(context, 'program_1') +
                                      ' ${screen1service.mapProgram["programNameFull"]}',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Roboto Mono',
                                        color: Colors.black,
                                        fontSize: 45 / sizeDevice,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BangbaoloiWidget(),
                                  ),
                                );
                              },
                              text: '${screen1service.status.value}',
                              options: FFButtonOptions(
                                width: 350 / sizeDevice,
                                height: 110 / sizeDevice,
                                color: screen1service.number_status.value == 3
                                    ? Color.fromARGB(255, 255, 0, 0)
                                    : screen1service.number_status.value == 1
                                        ? Color.fromARGB(255, 0, 199, 76)
                                        : screen1service.number_status.value ==
                                                2
                                            ? Colors.blue
                                            : Colors.yellow,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color:
                                          screen1service.number_status.value ==
                                                  0
                                              ? Colors.black
                                              : Colors.white,
                                      fontSize: 45 / sizeDevice,
                                      fontWeight: FontWeight.w500,
                                    ),
                                elevation: 10,
                                borderSide: BorderSide(
                                  color: Color(0xFF9E9E9E),
                                  width: 0,
                                ),
                                borderRadius: 20 / sizeDevice,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20 / sizeDevice, 15 / sizeDevice, 0, 0),
                          child: Container(
                            width: 960 / sizeDevice,
                            height: 130 / sizeDevice,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius:
                                  BorderRadius.circular(20 / sizeDevice),
                              border: Border.all(
                                color: Color(0xFF9E9E9E),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25 / sizeDevice,
                                          5 / sizeDevice,
                                          0,
                                          0),
                                      child: Text(
                                        // 'Trạng thái hoạt động',
                                        languageText(context, 'main_0'),
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Roboto Mono',
                                              color: Colors.black,
                                              fontSize: 20 / sizeDevice,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25 / sizeDevice,
                                            8 / sizeDevice,
                                            0,
                                            0),
                                        child: Text(
                                          '${screen1service.status_detail.value}',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto Mono',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                fontSize: 30 / sizeDevice,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 30 / sizeDevice, 0),
                                      child: RichText(
                                          text: TextSpan(
                                              text:
                                                  '${screen1service.number1.value}',
                                              style: TextStyle(
                                                  fontFamily: 'Roboto Mono',
                                                  fontSize: 65 / sizeDevice,
                                                  color: Colors.black),
                                              children: [
                                            TextSpan(
                                                text:
                                                    '${screen1service.space.value}',
                                                style: TextStyle(
                                                    fontFamily: 'Roboto Mono',
                                                    fontSize: 65 / sizeDevice,
                                                    color: Colors.black)),
                                            TextSpan(
                                                text:
                                                    '${screen1service.number2.value}',
                                                style: TextStyle(
                                                    fontFamily: 'Roboto Mono',
                                                    fontSize: 65 / sizeDevice,
                                                    color: Colors.black)),
                                          ])

                                          // '28 : 30',

                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //thông số chương trình đã chọn
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20 / sizeDevice, 15 / sizeDevice, 0, 0),
                          child: ProgramChoosedWidget(),
                        ),
                      ],
                    ),
                    //nhiệt độ và áp suất thực
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15 / sizeDevice, 15 / sizeDevice, 0, 0),
                      child: DataRealtimeWidget(),
                    ),
                  ],
                ),

                //hiển thị các nút bấm chọn và Start/Stop
                Row(
                  children: [
                    Container(
                      width: 1325 / sizeDevice,
                      height: 125 / sizeDevice,
                      margin: EdgeInsets.fromLTRB(
                          20 / sizeDevice, 10 / sizeDevice, 15 / sizeDevice, 0),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 30 / sizeDevice,
                            child: simpleIconButton(
                              context,
                              icon: Icons.person,
                              function: () async {
                                PopupScreen().inputPassword(
                                  context,
                                  password: '2009',
                                  textKeyboard: false,
                                  function: () {
                                    if (_timer1 != null) _timer1!.cancel();
                                    toPage(context, CaidatchuyensauWidget());
                                  },
                                );
                              },
                            ),
                          ),
                          Positioned(
                            left: 170 / sizeDevice,
                            child: simpleIconButton(
                              context,
                              icon: Icons.settings,
                              function: () async {
                                toPage(context, CaidatnhanhWidget());
                              },
                            ),
                          ),

                          //door status
                          Positioned(
                            left: 450 / sizeDevice,
                            child: Container(
                              height: 125 / sizeDevice,
                              width: 190 / sizeDevice,
                              child: screen1service.i0[5]
                                  ? Image.asset("assets/images/door_close.png")
                                  : Image.asset("assets/images/door_open.png"),
                            ),
                          ),

                          //trạng thái cửa
                          Positioned(
                            left: 511 / sizeDevice,
                            child: Container(
                                alignment: Alignment.center,
                                height: 125 / sizeDevice,
                                width: 120 / sizeDevice,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      languageText(context, 'door_1'),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Roboto Mono',
                                            color: Colors.black,
                                            fontSize: 20 / sizeDevice,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      languageText(context, 'door_2'),
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
                                )),
                          ),

                          //start/stop button
                          Positioned(
                              right: 110 / sizeDevice,
                              child: FlutterFlowIconButton(
                                borderColor: Color(0xFF9E9E9E),
                                borderRadius: 120 / sizeDevice,
                                borderWidth: 1,
                                buttonSize: 120 / sizeDevice,
                                fillColor: Color(0xFF73A1E0),
                                icon: !screen1service.startStop.value
                                    ? Icon(
                                        Icons.not_started,
                                        color: Color.fromARGB(255, 51, 255, 0),
                                        size: 100 / sizeDevice,
                                      )
                                    : Icon(
                                        Icons.not_started,
                                        color: Color.fromARGB(255, 255, 0, 0),
                                        size: 100 / sizeDevice,
                                      ),
                                onPressed: () {
                                  functionStartStop();
                                },
                              )),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void functionStartStop() {
    if (double.parse(screen1service.mapProgram["programTemp"]) > 0.0 &&
        screen1service.errorStatus.value == false &&
        screen1service.allowStart.value == true) {
      screen1service.startStop.value = !screen1service.startStop.value;
    } else {
      screen1service.startStop.value = false;
    }
  }
}
