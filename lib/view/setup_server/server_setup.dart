import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/services/mqtt_service.dart';
import 'package:iotsupperapp/services/server_service.dart';
import 'package:iotsupperapp/view/homepage/main_screen.dart';
import '../../helper/language.dart';
import '../../other_widget/appbar_back.dart';
import '../../services/screen1_service.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class ServerSetupWidget extends StatefulWidget {
  const ServerSetupWidget({Key? key}) : super(key: key);

  @override
  State<ServerSetupWidget> createState() => _ServerSetupWidgetState();
}

class _ServerSetupWidgetState extends State<ServerSetupWidget> {
  Screen1Service screen1service = Get.put(Screen1Service());
  TextEditingController usernameController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  TextEditingController serverController = TextEditingController(text: "");
  TextEditingController portController = TextEditingController(text: "");
  MqttService mqttService = Get.put(MqttService());
  ServerService serverService = Get.put(ServerService());

  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;

    return Scaffold(
      appBar: AppBarBack(
        context,
        title: languageText(context, "title_7"),
        callBack: () {
          Navigator.pop(context);
        },
        isGetBack: true,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 16 / sizeDevice),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/server.png',
                  width: 80 / sizeDevice,
                  height: 80 / sizeDevice,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      8 / sizeDevice, 8 / sizeDevice, 4 / sizeDevice, 0),
                  child: Text(languageText(context, 'server_2'),
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Roboto Mono',
                            color: Color(0xFF0F1113),
                            fontSize: 30 / sizeDevice,
                            fontWeight: FontWeight.w500,
                          )),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40 / sizeDevice),
            child: Row(
              children: [
                //server - port  ============================================================================
                Container(
                  margin: EdgeInsets.fromLTRB(
                      25 / sizeDevice, 0, 20 / sizeDevice, 0),
                  width: 650 / sizeDevice,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8 / sizeDevice),
                    border: Border.all(
                      color: Color(0xFFF1F4F8),
                      width: 2 / sizeDevice,
                    ),
                  ),
                  child: Column(children: [
                    //server=============================
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10 / sizeDevice, 0, 0),
                      child: Text(
                        languageText(context, 'server_3'),
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Roboto Mono',
                              color: Color(0xFF0F1113),
                              fontSize: 24 / sizeDevice,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20 / sizeDevice),
                      child: TextFormField(
                        style: TextStyle(fontSize: 24 / sizeDevice),
                        controller: serverController,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                              fontFamily: 'SVNGilroy',
                              color: Colors.grey,
                              fontSize: 24 / sizeDevice,
                            ),
                            hintText: mqttService.serverMqtt.value,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            )),
                        keyboardType: TextInputType.text,
                      ),
                    ),

                    //port =============================
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 30 / sizeDevice, 0, 0),
                      child: Text(
                        'Port',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Roboto Mono',
                              color: Color(0xFF0F1113),
                              fontSize: 24 / sizeDevice,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20 / sizeDevice),
                      child: TextFormField(
                        style: TextStyle(fontSize: 24 / sizeDevice),
                        controller: portController,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                              fontFamily: 'SVNGilroy',
                              color: Colors.grey,
                              fontSize: 24 / sizeDevice,
                            ),
                            hintText: mqttService.portServer.value.toString(),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            )),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ]),
                ),

                //username - password ========================================================================
                Container(
                  width: 650 / sizeDevice,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8 / sizeDevice),
                    border: Border.all(
                      color: Color(0xFFF1F4F8),
                      width: 2 / sizeDevice,
                    ),
                  ),
                  child: Column(children: [
                    //username ===================================
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10 / sizeDevice, 0, 0),
                      child: Text(
                        'username',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Roboto Mono',
                              color: Color(0xFF0F1113),
                              fontSize: 24 / sizeDevice,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20 / sizeDevice),
                      child: TextFormField(
                        style: TextStyle(fontSize: 24 / sizeDevice),
                        controller: usernameController,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                              fontFamily: 'SVNGilroy',
                              color: Colors.grey,
                              fontSize: 24 / sizeDevice,
                            ),
                            hintText: mqttService.username.value,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            )),
                        keyboardType: TextInputType.text,
                      ),
                    ),

                    //password ==================================
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 30 / sizeDevice, 0, 0),
                      child: Text(
                        'password',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Roboto Mono',
                              color: Color(0xFF0F1113),
                              fontSize: 24 / sizeDevice,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20 / sizeDevice),
                      child: TextFormField(
                        style: TextStyle(fontSize: 24 / sizeDevice),
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                              fontFamily: 'SVNGilroy',
                              color: Colors.grey,
                              fontSize: 24 / sizeDevice,
                            ),
                            hintText: mqttService.password.value,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            )),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),

          //button save
          Container(
              margin: EdgeInsets.fromLTRB(0, 30 / sizeDevice, 0, 0),
              width: 350 / sizeDevice,
              height: 80 / sizeDevice,
              color: Colors.green,
              child: OutlinedButton(
                onPressed: () async {
                  EasyLoading.show(status: 'Loading...');
                  await serverService.changeServer(
                      context,
                      serverController.text,
                      portController.text,
                      usernameController.text,
                      passwordController.text);
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
                child: Text(
                  // 'Lưu',
                  languageText(context, 'program_9'),
                  textAlign: TextAlign.end,
                  style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Roboto Mono',
                        color: Colors.white,
                        fontSize: 30 / sizeDevice,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.all(10 / sizeDevice))),
              ))
        ]),
      ),
    );
  }
}
