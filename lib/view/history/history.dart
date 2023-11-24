import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:iotsupperapp/helper/language.dart';
import '../../other_widget/appbar_back.dart';
import '../../services/screen1_service.dart';
import '../../services/server_service.dart';

class HistoryData extends StatefulWidget {
  const HistoryData({Key? key}) : super(key: key);

  @override
  State<HistoryData> createState() => _HistoryDataState();
}

class _HistoryDataState extends State<HistoryData> {
  Screen1Service screen1service = Get.put(Screen1Service());
  ServerService serverService = Get.put(ServerService());
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    double sizeDevice = screen1service.sizeDevice.value;
    return Scaffold(
      appBar: AppBarBack(context, title: languageText(context, 'title_9')),
      backgroundColor: Color(0xFFF1F4F8),
      body: Scrollbar(
        controller: controller,
        thickness: 15 / sizeDevice,
        thumbVisibility: true,
        trackVisibility: true,
        child: Container(
          padding: EdgeInsets.fromLTRB(50 / sizeDevice, 0, 0, 0),
          child: ListView.builder(
            controller: controller,
            itemCount: serverService.duLieuMeHap.length,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text(
                  serverService.duLieuMeHap[index],
                  style: TextStyle(fontSize: 25 / sizeDevice),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
