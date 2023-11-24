import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/helper/language.dart';
import 'package:provider/provider.dart';

import '../language_providers/language_provider.dart';
import '../services/screen1_service.dart';
import '../view/flutter_flow/flutter_flow_icon_button.dart';
import '../view/flutter_flow/flutter_flow_theme.dart';

PreferredSize AppBarBack(
  BuildContext context, {
  String title = '',
  Function? callBack,
  bool isGetBack = true,
  Widget? action,
}) {
  final languageProvider = Provider.of<LanguageProvider>(context, listen: true);
  Screen1Service screen1service = Get.put(Screen1Service());
  double sizeDevice = screen1service.sizeDevice.value;
  return PreferredSize(
    preferredSize: Size.fromHeight(70 / sizeDevice),
    child: AppBar(
      backgroundColor: Color.fromARGB(47, 150, 210, 255),
      automaticallyImplyLeading: false,
      flexibleSpace: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  // width: 100 / sizeDevice,
                  padding: EdgeInsets.fromLTRB(20 / sizeDevice, 0, 0, 0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 35 / sizeDevice,
                    borderWidth: 1,
                    buttonSize: 70 / sizeDevice,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                      size: 40 / sizeDevice,
                    ),
                    onPressed: () async {
                      if (callBack != null) callBack();
                      if (isGetBack) Navigator.pop(context);
                    },
                    fillColor: Colors.white,
                  ),
                ),
                Container(
                  // color: Colors.amber,
                  width: 1110 / sizeDevice,
                  margin: EdgeInsets.fromLTRB(
                      30 / sizeDevice, 0, 30 / sizeDevice, 0),
                  alignment: Alignment.center,
                  child: Text(
                    // 'Trở về',
                    title,
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Roboto Mono',
                          color: Colors.black,
                          fontSize: 36 / sizeDevice,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                if (action != null)
                  Container(
                      // color: Colors.green,
                      // padding: EdgeInsets.fromLTRB(1000 / sizeDevice, 0, 0, 0),
                      child: action)
              ],
            ),
          ),
        ],
      ),
      actions: [],
      elevation: 5,
    ),
  );
}
