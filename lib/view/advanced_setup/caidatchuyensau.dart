import 'package:iotsupperapp/helper/language.dart';
import 'package:iotsupperapp/helper/router.dart';
import 'package:iotsupperapp/services/screen1_service.dart';
import 'package:iotsupperapp/view/advanced_setup/setup_offset.dart';
import 'package:iotsupperapp/view/advanced_setup/setup_vacuum.dart';
import '../../other_widget/appbar_back.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/view/manual_mode/vanhanhtay.dart';
import 'package:flutter/material.dart';
import '../homepage/main_screen.dart';
import '../trangthai_I_O/trangthai_I_O.dart';

class CaidatchuyensauWidget extends StatefulWidget {
  @override
  _CaidatchuyensauWidgetState createState() => _CaidatchuyensauWidgetState();
}

class _CaidatchuyensauWidgetState extends State<CaidatchuyensauWidget> {
  Screen1Service screen1service = Get.put(Screen1Service());

  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;
    return Scaffold(
      appBar: AppBarBack(
        context,
        title: languageText(context, 'title_10'),
        callBack: () async {
          toPage(context, MainScreen());
        },
        isGetBack: false,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(0, 12 / sizeDevice, 0, 0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    // //trạng thái I-O
                    // Padding(
                    //   padding: EdgeInsetsDirectional.fromSTEB(
                    //       16 / sizeDevice, 0, 16 / sizeDevice, 8 / sizeDevice),
                    //   child: InkWell(
                    //     onTap: () async {
                    //       toPage(context, TrangThaiIOWidget());
                    //     },
                    //     child: Container(
                    //       width: double.infinity,
                    //       height: 150 / sizeDevice,
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         boxShadow: [
                    //           BoxShadow(
                    //             blurRadius: 3,
                    //             color: Color(0x411D2429),
                    //             offset: Offset(0, 1),
                    //           )
                    //         ],
                    //         borderRadius: BorderRadius.circular(8 / sizeDevice),
                    //       ),
                    //       child: Padding(
                    //         padding: EdgeInsetsDirectional.fromSTEB(
                    //             8 / sizeDevice,
                    //             8 / sizeDevice,
                    //             8 / sizeDevice,
                    //             8 / sizeDevice),
                    //         child: Row(
                    //           mainAxisSize: MainAxisSize.max,
                    //           children: [
                    //             ClipRRect(
                    //               borderRadius: BorderRadius.circular(6),
                    //               child: Image.asset(
                    //                 'assets/images/onoff.png',
                    //                 width: 80 / sizeDevice,
                    //                 height: 80 / sizeDevice,
                    //                 fit: BoxFit.cover,
                    //               ),
                    //             ),
                    //             Expanded(
                    //               child: Padding(
                    //                 padding: EdgeInsetsDirectional.fromSTEB(
                    //                     8 / sizeDevice,
                    //                     8 / sizeDevice,
                    //                     4 / sizeDevice,
                    //                     0),
                    //                 child: Text(
                    //                   // trạng thái thiết bị,
                    //                   languageText(
                    //                       context, 'advanced_setup_13'),
                    //                   style: FlutterFlowTheme.of(context)
                    //                       .title3
                    //                       .override(
                    //                         fontFamily: 'Roboto Mono',
                    //                         color: Color(0xFF0F1113),
                    //                         fontSize: 24 / sizeDevice,
                    //                         fontWeight: FontWeight.w500,
                    //                       ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    // Padding(
                    //   padding: EdgeInsetsDirectional.fromSTEB(
                    //       16 / sizeDevice, 0, 16 / sizeDevice, 8 / sizeDevice),
                    //   child: InkWell(
                    //     onTap: () async {
                    //       if (screen1service.startStop == true) {
                    //       } else {
                    //         setState(() {
                    //           screen1service.manual_mode.value = true;
                    //         });
                    //         toPage(context, VHbangtayWidget());
                    //       }
                    //     },
                    //     //vận hành tay
                    //     child: Container(
                    //       width: double.infinity,
                    //       height: 150 / sizeDevice,
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         boxShadow: [
                    //           BoxShadow(
                    //             blurRadius: 3,
                    //             color: Color(0x411D2429),
                    //             offset: Offset(0, 1),
                    //           )
                    //         ],
                    //         borderRadius: BorderRadius.circular(8 / sizeDevice),
                    //       ),
                    //       child: Padding(
                    //         padding: EdgeInsetsDirectional.fromSTEB(
                    //             8 / sizeDevice,
                    //             8 / sizeDevice,
                    //             8 / sizeDevice,
                    //             8 / sizeDevice),
                    //         child: Row(
                    //           mainAxisSize: MainAxisSize.max,
                    //           children: [
                    //             ClipRRect(
                    //               borderRadius: BorderRadius.circular(6),
                    //               child: Image.asset(
                    //                 'assets/images/manual_mode_icon.png',
                    //                 width: 80 / sizeDevice,
                    //                 height: 80 / sizeDevice,
                    //                 fit: BoxFit.cover,
                    //               ),
                    //             ),
                    //             Expanded(
                    //               child: Padding(
                    //                 padding: EdgeInsetsDirectional.fromSTEB(
                    //                     8 / sizeDevice,
                    //                     8 / sizeDevice,
                    //                     4 / sizeDevice,
                    //                     0),
                    //                 child: Text(
                    //                   // 'Vận hành bằng tay',
                    //                   languageText(context, 'advanced_setup_0'),
                    //                   style: FlutterFlowTheme.of(context)
                    //                       .title3
                    //                       .override(
                    //                         fontFamily: 'Roboto Mono',
                    //                         color: Color(0xFF0F1113),
                    //                         fontSize: 24 / sizeDevice,
                    //                         fontWeight: FontWeight.w500,
                    //                       ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    //cài đặt offset
                    SetupOffsetWidget(),

                    //cài đặt hút chân không
                    SetupVacuumWidget(),

                    // //cài thời gian xả nhanh
                    // SetupExhaustWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
