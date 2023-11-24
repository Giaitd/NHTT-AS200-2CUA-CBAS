import 'package:iotsupperapp/helper/language.dart';
import 'package:iotsupperapp/helper/router.dart';
import 'package:iotsupperapp/other_widget/appbar_back.dart';
import 'package:iotsupperapp/view/program/button_choose_15_program.dart';
import 'package:iotsupperapp/view/program/parameter_program.dart';
import 'package:iotsupperapp/view/program/thaydoithongsochuongtrinh.dart';
import 'package:iotsupperapp/services/screen1_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../popup_screen/popup_screen.dart';

class ChonchuongtrinhWidget extends StatefulWidget {
  @override
  _ChonchuongtrinhWidgetState createState() => _ChonchuongtrinhWidgetState();
}

class _ChonchuongtrinhWidgetState extends State<ChonchuongtrinhWidget> {
  Screen1Service screen1service = Get.put(Screen1Service());

  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarBack(context,
            title: languageText(context, 'title_0'),
            action: GestureDetector(
              child: Container(
                width: 100 / sizeDevice,
                height: 100 / sizeDevice,
                child: Icon(
                  Icons.settings,
                  size: 50 / sizeDevice,
                ),
              ),
              onLongPress: () {
                PopupScreen().inputPassword(context, function: () {
                  toPage(context, ThayDoiThongSoChuongTrinh());
                });
              },
            )),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: 700 / sizeDevice,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0,
                    color: Color(0x3B1D2429),
                  )
                ],
                borderRadius: BorderRadius.circular(0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  //thông số chương trình chọn
                  ParameterProgram(),

                  //chọn chương trình
                  ButtonChoose15Program(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
