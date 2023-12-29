import 'package:cop/models/lesson_model.dart';
import 'package:cop/view/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/my_component.dart';
import '../constant/api_constant.dart';
import '../models/main_model.dart';
import '../models/term_model.dart';

class HomeScreenController extends GetxController {
  RxList<MainModel> mainlist = RxList();
  RxList<TermModel> termList = RxList();
  RxList<Widget> tabList = RxList();
  RxList<LessonModel> onetermList = RxList();
  RxList<Widget> alltermList = RxList();
  TabController? cont;

  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;
    Uri url = Uri.parse(ApiUrlConstant.getHomeItems);

    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(utf8.decode(response.bodyBytes));

      mainlist.add(MainModel(info: jsonData));

      mainlist[0].info.forEach((element) {
        termList.add(TermModel(title: element["title"]));
      });
      for (var element in termList) {
        tabList.add(Tabcanti(tex: element.title));
      }
      mainlist[0].info.forEach((element) {
        element["lesson"].forEach((elem) {
          onetermList.add(LessonModel(
              id: elem['id'].toString(),
              imageUrl: elem['imgurl'] ?? 'imgurl',
              title: elem['title'],
              cologe: elem['colloge'].toString(),
              vahed: elem['vahed'].toString()));
        });
        alltermList.add(CardsForAllLessens(alltermlesson: onetermList));
        onetermList = RxList();
      });

      loading.value = false;
    }
  }
}