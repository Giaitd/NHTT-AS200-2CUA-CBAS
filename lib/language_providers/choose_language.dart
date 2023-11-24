// import 'dart:html';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iotsupperapp/language_providers/select_language.dart';

import '../services/screen1_service.dart';

class ChooseLanguageWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var setDropdownValue;
  SelectLanguageModel dropdownValue;
  List<SelectLanguageModel> listDropdownValue;

  ChooseLanguageWidget(
    BuildContext context, {
    Key? key,
    required this.setDropdownValue,
    required this.listDropdownValue,
    required this.dropdownValue,
  }) : super(key: key);

  Screen1Service screen1service = Get.put(Screen1Service());

  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;

    return Container(
      width: 220 / sizeDevice,
      height: 65 / sizeDevice,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.blueAccent,
            width: 3 / sizeDevice,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(9 / sizeDevice)),
        ),
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: DropdownButtonHideUnderline(
            child: DropdownButton2(
          value: dropdownValue,
          items: listDropdownValue.map((SelectLanguageModel value) {
            return DropdownMenuItem(
              value: value,
              child: Row(
                children: [
                  Image.asset(
                    value.img,
                    width: 50 / sizeDevice,
                    height: 25 / sizeDevice,
                  ),
                  SizedBox(width: 5 / sizeDevice),
                  Text(
                    value.name,
                    style: TextStyle(
                      inherit: true,
                      color: Colors.black,
                      fontSize: 25 / sizeDevice,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (val) => setDropdownValue(val),
          icon: Icon(Icons.arrow_drop_down,
              size: 40 / sizeDevice, color: Colors.black),
          iconDisabledColor: Colors.red,
          iconEnabledColor: Colors.green,
          dropdownDecoration: const BoxDecoration(
            color: Colors.white,
          ),
          itemPadding:
              EdgeInsets.only(top: 3 / sizeDevice, bottom: 3 / sizeDevice),
          dropdownMaxHeight: 200 / sizeDevice,
          scrollbarRadius: Radius.circular(40 / sizeDevice),
          scrollbarThickness: 3 / sizeDevice,
          scrollbarAlwaysShow: true,
          dropdownPadding: null,
          itemHeight: 45 / sizeDevice,
        )),
      ),
    );
  }
}
