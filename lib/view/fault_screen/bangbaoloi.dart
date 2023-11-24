import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/helper/language.dart';
import 'package:iotsupperapp/other_widget/appbar_back.dart';
import 'package:iotsupperapp/services/screen1_service.dart';
import 'package:iotsupperapp/services/server_service.dart';
import 'package:iotsupperapp/view/popup_screen/popup_screen.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class BangbaoloiWidget extends StatefulWidget {
  @override
  _BangbaoloiWidgetState createState() => _BangbaoloiWidgetState();
}

class _BangbaoloiWidgetState extends State<BangbaoloiWidget> {
  Screen1Service screen1service = Get.put(Screen1Service());
  // ServerService serverService = Get.put(ServerService());
  ScrollController controller = ScrollController();
  final storage = new FlutterSecureStorage();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  static const platform = MethodChannel('giaitd.com/data');

  Future<void> resetFault() async {
    try {
      await platform.invokeMethod(
          'resetButton', {"reset": screen1service.btnReset.value});
    } on PlatformException catch (e) {
      print(e);
    }
  }

  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @override
  void initState() {
    super.initState();
    initFunction();
  }

  initFunction() async {
    var a = await storage.read(key: 'listError', aOptions: getAndroidOptions());
    screen1service.listDataError.clear();
    List<dynamic> tg = jsonDecode(a!);
    for (int i = tg.length - 1; i >= 0; i--) {
      screen1service.listDataError.add(tg[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;
    return Obx(
      () => Scaffold(
        key: scaffoldKey,
        appBar: AppBarBack(
          context,
          title: languageText(context, 'title_3'),
          action: GestureDetector(
            child: Container(
              width: 100 / sizeDevice,
              height: 100 / sizeDevice,
              child: Text(''),
            ),
            onDoubleTap: () {
              PopupScreen().xoaDanhSachLoi(context, function: () async {
                await storage.delete(
                    key: 'listError', aOptions: getAndroidOptions());
                Navigator.pop(context);
              });
            },
          ),
        ),
        backgroundColor: Color(0xFFF1F4F8),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                /*==========----ListView Fault----===========*/
                Container(height: 10 / sizeDevice),
                Container(
                  height: 50 / sizeDevice,
                  color: Colors.blue,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 70 / sizeDevice,
                        child: Text(
                          // 'STT',
                          languageText(context, 'error_0'),
                          style: TextStyle(
                              fontSize: 24 / sizeDevice,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 1,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 290 / sizeDevice,
                        child: Text(
                          // 'Thời gian xảy ra lỗi',
                          languageText(context, 'error_1'),
                          style: TextStyle(
                              fontSize: 24 / sizeDevice,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 1,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 948 / sizeDevice,
                        child: Text(
                          // 'Tên lỗi',
                          languageText(context, 'error_2'),
                          style: TextStyle(
                              fontSize: 24 / sizeDevice,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 530 / sizeDevice,
                  color: const Color.fromARGB(255, 236, 236, 236),
                  child: Scrollbar(
                    controller: controller,
                    thickness: 15 / sizeDevice,
                    thumbVisibility: true,
                    trackVisibility: true,
                    child: Container(
                      child: ListView.builder(
                        controller: controller,
                        itemCount: screen1service.listDataError.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            leading: Text(
                              "${screen1service.listDataError.length - index}",
                              style: TextStyle(fontSize: 25 / sizeDevice),
                            ),
                            title: Text(
                              screen1service.listDataError[index],
                              style: TextStyle(fontSize: 25 / sizeDevice),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                /*==========----------------------===========*/
                Container(
                  height: 20 / sizeDevice,
                ),

                //Button reset
                Container(
                  height: 80 / sizeDevice,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 30 / sizeDevice,
                        child: Container(
                            height: 80 / sizeDevice,
                            width: 200 / sizeDevice,
                            child: FFButtonWidget(
                              text: 'RESET',
                              onPressed: () async {
                                screen1service.btnReset.value = true;
                                resetFault();
                                // serverService.addLoiKhiChay.value = false;
                                // serverService
                                //     .resetBienNho(); //xóa biến nhớ để pub dữ liệu lên server
                              },
                              options: FFButtonOptions(
                                width: double.infinity,
                                color: Color(0xFF73A1E0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: (screen1service.btnReset.value ==
                                              true)
                                          ? Colors.black
                                          : Colors.red,
                                      fontSize: 30 / sizeDevice,
                                      fontWeight: FontWeight.w500,
                                    ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Color(0x00F1F4F8),
                                  width: 1,
                                ),
                                borderRadius: 10 / sizeDevice,
                              ),
                            )),
                      ),
                    ],
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
