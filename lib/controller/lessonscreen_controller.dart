import 'package:get/get.dart';
import '../constant/api_constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LessonScrennController extends GetxController {
  RxList<Map<String,dynamic>> mainproflist = RxList();
  RxBool loading = false.obs;
  String id;
  LessonScrennController({required this.id});
  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async{
    loading.value = true;
    Uri url = Uri.parse(ApiUrlConstant.getprofItems+id);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
          jsonData.forEach((element) {
        mainproflist.add(element);
      });
      loading.value = false;

    }
  }
}
