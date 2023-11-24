import 'package:flutter/material.dart';
import 'package:get/get.dart';

void toPage(BuildContext context, Widget page, {Transition? transition}) async {
  try {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
  } catch (e) {
    print('Hongphat Exception catched: e == $e');
  }
}
