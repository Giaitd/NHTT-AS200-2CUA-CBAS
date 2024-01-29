import 'dart:async';
import 'package:flutter/services.dart';
import 'package:iotsupperapp/helper/language.dart';
import 'package:iotsupperapp/other_widget/appbar_back.dart';
import 'package:iotsupperapp/other_widget/simple_button.dart';
import 'package:iotsupperapp/view/manual_mode/realdata_man_mode.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/services/screen1_service.dart';
import 'package:flutter/material.dart';

class VHbangtayWidget extends StatefulWidget {
  @override
  _VHbangtayWidgetState createState() => _VHbangtayWidgetState();
}

class _VHbangtayWidgetState extends State<VHbangtayWidget> {
  Screen1Service screen1service = Get.put(Screen1Service());

  late Timer _timer2;
  static const platform = MethodChannel('giaitd.com/data');

  @override
  void initState() {
    super.initState();
    _timer2 = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      _sendButtonData();
    });
  }

  //get-set data from native code
  Future<void> _sendButtonData() async {
    var sendButtonStatusToNative = <String, dynamic>{
      "manSteamToChamber": screen1service.man_bomhoi.value,
      "manFastExhausted": screen1service.man_xanhanh.value,
      "manSlowExhausted": screen1service.man_xacham.value,
      "manVacuum": screen1service.man_hck.value,
      "manBalanced": screen1service.man_cba.value,
      "manWaterCool": screen1service.man_capnuocmat.value,
      "manAirGasket1In": screen1service.man_capkhigioang1.value,
      "manAirGasket1Out": screen1service.man_xakhigioang1.value,
      "manAirGasket2In": screen1service.man_capkhigioang2.value,
      "manAirGasket2Out": screen1service.man_xakhigioang2.value,
      "manCompressorExhaust": screen1service.man_xamaynenkhi.value,
    };
    try {
      await platform.invokeMethod(
          'dataButtonToNative', sendButtonStatusToNative);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;

    return Obx(
      () => Scaffold(
        appBar: AppBarBack(context, title: languageText(context, 'title_6'),
            callBack: () {
          _timer2.cancel();
          screen1service.man_bomhoi.value = false;
          screen1service.man_xanhanh.value = false;
          screen1service.man_xacham.value = false;
          screen1service.man_hck.value = false;
          screen1service.man_cba.value = false;
          screen1service.man_capnuocmat.value = false;
          screen1service.man_capkhigioang1.value = false;
          screen1service.man_xakhigioang1.value = false;
          screen1service.man_capkhigioang2.value = false;
          screen1service.man_xakhigioang2.value = false;
          screen1service.manual_mode.value = false;
          screen1service.man_xamaynenkhi.value = false;
          _sendButtonData();
        }),
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                //giá trị thực
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30 / sizeDevice,
                      20 / sizeDevice, 10 / sizeDevice, 15 / sizeDevice),
                  child: RealdataManualMode(),
                ),

                //button
                Container(
                  width: 960 / sizeDevice,
                  height: 660 / sizeDevice,
                  child: Column(children: [
                    Container(
                      height: 132 / sizeDevice,
                      child: Row(
                        children: [
                          //van bơm hơi
                          manualButton(context,
                              btnName: languageText(context, 'man_mode_1'),
                              active: screen1service.man_bomhoi.value,
                              function: () {
                            setState(() {
                              screen1service.man_bomhoi.value =
                                  !screen1service.man_bomhoi.value;
                            });
                          }),

                          //van xả nhanh
                          manualButton(context,
                              btnName: languageText(context, 'man_mode_5'),
                              active: screen1service.man_xanhanh.value,
                              function: () {
                            setState(() {
                              screen1service.man_xanhanh.value =
                                  !screen1service.man_xanhanh.value;
                            });
                          }),

                          //van xả chậm
                          manualButton(context,
                              btnName: languageText(context, 'man_mode_9'),
                              active: screen1service.man_xacham.value,
                              function: () {
                            setState(() {
                              screen1service.man_xacham.value =
                                  !screen1service.man_xacham.value;
                            });
                          }),
                        ],
                      ),
                    ),
                    //hàng 2
                    Container(
                      height: 132 / sizeDevice,
                      child: Row(
                        children: [
                          //máy hck
                          manualButton(context,
                              btnName: languageText(context, 'man_mode_3'),
                              active: screen1service.man_hck.value,
                              function: () {
                            setState(() {
                              screen1service.man_hck.value =
                                  !screen1service.man_hck.value;
                            });
                          }),

                          //van CBA
                          manualButton(context,
                              btnName: languageText(context, 'man_mode_6'),
                              active: screen1service.man_cba.value,
                              function: () {
                            setState(() {
                              screen1service.man_cba.value =
                                  !screen1service.man_cba.value;
                            });
                          }),

                          //van cấp khí gioăng trước
                          manualButton(context,
                              btnName: languageText(context, 'man_mode_7'),
                              active: screen1service.man_capkhigioang1.value,
                              function: () {
                            setState(() {
                              screen1service.man_capkhigioang1.value =
                                  !screen1service.man_capkhigioang1.value;
                            });
                          }),
                        ],
                      ),
                    ),
                    //hàng 3
                    Container(
                      height: 132 / sizeDevice,
                      child: Row(
                        children: [
                          //van xả khí gioăng trước
                          manualButton(context,
                              btnName: languageText(context, 'man_mode_4'),
                              active: screen1service.man_xakhigioang1.value,
                              function: () {
                            setState(() {
                              screen1service.man_xakhigioang1.value =
                                  !screen1service.man_xakhigioang1.value;
                            });
                          }),

                          //cấp khi gioăng sau
                          manualButton(context,
                              btnName: languageText(context, 'man_mode_13'),
                              active: screen1service.man_capkhigioang2.value,
                              function: () {
                            setState(() {
                              screen1service.man_capkhigioang2.value =
                                  !screen1service.man_capkhigioang2.value;
                            });
                          }),

                          //xả khí gioăng sau
                          manualButton(context,
                              btnName: languageText(context, 'man_mode_12'),
                              active: screen1service.man_xakhigioang2.value,
                              function: () {
                            setState(() {
                              screen1service.man_xakhigioang2.value =
                                  !screen1service.man_xakhigioang2.value;
                            });
                          }),
                        ],
                      ),
                    ),

                    //hàng 4
                    Container(
                      height: 132 / sizeDevice,
                      child: Row(
                        children: [
                          //van nc làm mát
                          manualButton(context,
                              btnName: languageText(context, 'man_mode_15'),
                              active: screen1service.man_capnuocmat.value,
                              function: () {
                            setState(() {
                              screen1service.man_capnuocmat.value =
                                  !screen1service.man_capnuocmat.value;
                            });
                          }),

                          //van xả máy nén khí
                          manualButton(context,
                              btnName: languageText(context, 'man_mode_14'),
                              active: screen1service.man_xamaynenkhi.value,
                              function: () {
                            setState(() {
                              screen1service.man_xamaynenkhi.value =
                                  !screen1service.man_xamaynenkhi.value;
                            });
                          }),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
