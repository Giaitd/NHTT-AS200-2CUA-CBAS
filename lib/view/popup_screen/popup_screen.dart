import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/helper/language.dart';
import 'package:iotsupperapp/services/program_service.dart';
import 'package:iotsupperapp/services/screen1_service.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class PopupScreen extends StatelessWidget {
  Screen1Service screen1service = Get.put(Screen1Service());
  ProgramService programService = Get.put(ProgramService());
  final storage = FlutterSecureStorage();

  bool value1 = false;
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  //cửa sổ chương tình tùy chọn
  createUserProgram(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;
    String _ster_time = '';
    String _dry_time = '';
    String _temp = '';
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(
          // 'Chương trình tùy chọn',
          languageText(context, 'program_7'),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Roboto Mono',
                color: Colors.black,
                fontSize: 30 / sizeDevice,
                fontWeight: FontWeight.w500,
              ),
        ),
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(15 / sizeDevice, 0, 15 / sizeDevice, 0),
            child: TextField(
              onChanged: (Text) {
                _temp = Text;
              },
              style: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: 'Roboto Mono',
                    color: Colors.black,
                    fontSize: 20 / sizeDevice,
                    fontWeight: FontWeight.w500,
                  ),
              decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Roboto Mono',
                        color: Colors.black,
                        fontSize: 20 / sizeDevice,
                      ),
                  labelText: languageText(context, 'program_2') + ' (oC)',
                  hintStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Roboto Mono',
                        color: Colors.black,
                        fontSize: 20 / sizeDevice,
                      ),
                  hintText: '100-140',
                  border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                15 / sizeDevice, 15 / sizeDevice, 15 / sizeDevice, 0),
            child: TextField(
              onChanged: (Text) {
                _ster_time = Text;
              },
              style: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: 'Roboto Mono',
                    color: Colors.black,
                    fontSize: 20 / sizeDevice,
                    fontWeight: FontWeight.w500,
                  ),
              decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Roboto Mono',
                        color: Colors.black,
                        fontSize: 20 / sizeDevice,
                      ),
                  labelText: languageText(context, 'program_3') +
                      ' (' +
                      languageText(context, 'min') +
                      ')',
                  hintStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Roboto Mono',
                        color: Colors.black,
                        fontSize: 20 / sizeDevice,
                      ),
                  hintText: '1.0-9999.0',
                  border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                15 / sizeDevice, 15 / sizeDevice, 15 / sizeDevice, 0),
            child: TextField(
              onChanged: (Text) {
                _dry_time = Text;
              },
              style: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: 'Roboto Mono',
                    color: Colors.black,
                    fontSize: 20 / sizeDevice,
                    fontWeight: FontWeight.w500,
                  ),
              decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Roboto Mono',
                        color: Colors.black,
                        fontSize: 20 / sizeDevice,
                      ),
                  labelText: languageText(context, 'program_4') +
                      ' (' +
                      languageText(context, 'min') +
                      ')',
                  hintStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Roboto Mono',
                        color: Colors.black,
                        fontSize: 20 / sizeDevice,
                      ),
                  hintText: '1-99',
                  border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                15 / sizeDevice, 15 / sizeDevice, 15 / sizeDevice, 0),
            child: FFButtonWidget(
              //btn lưu
              text: languageText(context, 'program_9'),
              onPressed: () async {
                if (_temp == '' ||
                    _ster_time == '' ||
                    _dry_time == '' ||
                    double.parse(_temp) < 100 ||
                    double.parse(_temp) > 140 ||
                    double.parse(_temp) % 1 > 0 ||
                    double.parse(_ster_time) < 1 ||
                    double.parse(_ster_time) > 9999 ||
                    double.parse(_dry_time) < 1 ||
                    double.parse(_dry_time) > 9999 ||
                    double.parse(_dry_time) % 1 > 0) {
                  anoun_Dialog(context);
                } else {
                  screen1service.font_size_program.value = 50.0 / sizeDevice;
                  screen1service.program_name.value = 'User';
                  screen1service.program.value = 'User';
                  screen1service.temp_set.value = double.parse(_temp);
                  screen1service.ster_time_set.value = double.parse(_ster_time);
                  screen1service.dry_time_set.value = int.parse(_dry_time);
                  programService.convertTandP();
                  programService.writeDataProgram();
                  Navigator.pop(context);
                }
              },
              options: FFButtonOptions(
                width: 200 / screen1service.sizeDevice.value,
                height: 70 / screen1service.sizeDevice.value,
                color: Colors.green,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Roboto Mono',
                      color: Colors.white,
                      fontSize: 24 / screen1service.sizeDevice.value,
                      fontWeight: FontWeight.w500,
                    ),
                elevation: 5,
                borderRadius: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //cửa sổ báo lỗi nhập thông số
  anoun_Dialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                //cảnh báo
                languageText(context, 'anoun_dialog_0'),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Roboto Mono',
                      color: Colors.black,
                      fontSize: 30 / screen1service.sizeDevice.value,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              content: Text(
                // 'Giá trị nhập không hợp lệ. Hãy nhập lại',
                languageText(context, 'anoun_dialog_1'),
                style: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Roboto Mono',
                      color: Colors.black,
                      fontSize: 20 / screen1service.sizeDevice.value,
                    ),
              ),
              actions: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    // 'Đồng ý',
                    languageText(context, 'anoun_dialog_2'),
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Roboto Mono',
                          color: Colors.black,
                          fontSize: 25 / screen1service.sizeDevice.value,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(
                          10 / screen1service.sizeDevice.value))),
                )
              ],
            ));
  }

  //cảnh báo chưa chọn chương trình khi chạy
  anoun_Unselect_Programe(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                languageText(context, 'anoun_dialog_0'),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Roboto Mono',
                      color: Colors.black,
                      fontSize: 25 / screen1service.sizeDevice.value,
                    ),
              ),
              content: Text(
                // 'Chọn chương trình trước khi chạy',
                languageText(context, 'anoun_dialog_3'),
                style: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Roboto Mono',
                      color: Colors.black,
                      fontSize: 20 / screen1service.sizeDevice.value,
                    ),
              ),
              actions: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    // 'Đồng ý',
                    languageText(context, 'anoun_dialog_2'),
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Roboto Mono',
                          color: Colors.black,
                          fontSize: 25 / screen1service.sizeDevice.value,
                        ),
                  ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(
                          10 / screen1service.sizeDevice.value))),
                )
              ],
            ));
  }

  //password level 1
  inputPassword(BuildContext context,
      {Function? function,
      String password = 'hongphat2009',
      bool textKeyboard = true}) {
    double sizeDevice = screen1service.sizeDevice.value;
    String _password = '';
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              backgroundColor: const Color(0xFFF0F0F0),
              children: [
                Container(
                  width: 500 / sizeDevice,
                  height: 170 / sizeDevice,
                  padding: EdgeInsets.fromLTRB(25 / sizeDevice, 10 / sizeDevice,
                      25 / sizeDevice, 10 / sizeDevice),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 40 / sizeDevice),
                        alignment: Alignment.center,
                        child: Text(
                          // 'Nhập mật khẩu',
                          languageText(context, 'sign_in_4'),
                          style: TextStyle(
                              fontSize: 30 / sizeDevice,
                              fontFamily: 'Roboto Mono',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        onChanged: (text) => {
                          _password = text,
                          if (_password == password)
                            {
                              if (function != null) function(),
                            }
                        },
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: '****',
                          hintStyle: TextStyle(
                            fontFamily: 'Roboto Mono',
                            color: Colors.black,
                            fontSize: 20 / sizeDevice,
                          ),
                          border: const OutlineInputBorder(),
                        ),
                        keyboardType: textKeyboard
                            ? TextInputType.text
                            : TextInputType.number,
                        style: TextStyle(
                          fontFamily: 'Roboto Mono',
                          color: Colors.black,
                          fontSize: 24 / sizeDevice,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ));
  }

  //cửa sổ báo lỗi nhập thông số
  xoaDanhSachLoi(BuildContext context, {Function? function}) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: Text(
                'Xóa danh sách lỗi',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Roboto Mono',
                      color: Colors.black,
                      fontSize: 30 / screen1service.sizeDevice.value,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              children: [
                Container(
                  width: 400 / screen1service.sizeDevice.value,
                  height: 100 / screen1service.sizeDevice.value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FFButtonWidget(
                        text: 'Hủy',
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        options: FFButtonOptions(
                          width: 200 / screen1service.sizeDevice.value,
                          height: 50 / screen1service.sizeDevice.value,
                          color: Colors.green,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Roboto Mono',
                                color: Colors.white,
                                fontSize: 24 / screen1service.sizeDevice.value,
                                fontWeight: FontWeight.w500,
                              ),
                          elevation: 5,
                          borderRadius: 10,
                        ),
                      ),
                      FFButtonWidget(
                        text: 'Có, xóa ngay',
                        onPressed: () async {
                          if (function != null) function();
                        },
                        options: FFButtonOptions(
                          width: 200 / screen1service.sizeDevice.value,
                          height: 50 / screen1service.sizeDevice.value,
                          color: Colors.red,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Roboto Mono',
                                color: Colors.white,
                                fontSize: 24 / screen1service.sizeDevice.value,
                                fontWeight: FontWeight.w500,
                              ),
                          elevation: 5,
                          borderRadius: 10,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ));
  }
}
