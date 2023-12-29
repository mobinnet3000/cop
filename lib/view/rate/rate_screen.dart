import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../components/dimens.dart';
import '../../components/mdecoratons.dart';
import '../../components/text_style.dart';
import '../../constant/api_constant.dart';
import '../../constant/my_colors.dart';
import '../../constant/my_strings.dart';
import '../main/main_screen.dart';
import 'package:http/http.dart' as http;

RxMap serversend = {
    "id": 0,
    "f1": 50.0,
    "f2": 50.0,
    "f3": 50.0,
    "f4": 50.0,
    "f5": 50.0,
    "f6": 50.0
}.obs;
class RateScreen extends StatelessWidget {
  final String name;
  final String id;
  final String email;
  const RateScreen({super.key, required this.name, required this.email, required this.id});
  
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    serversend.value['id'] = int.parse(id);
    return MainScreenAppbarFull(
        mainbody: Stack(
      children: [
        // طراحی کل صفحه به جز دکمه پایین
        Container(
          // رنگ بک
          decoration: MyDecorations.backgradient,
          // ایتم های روی صفحه
          child: ListView(
            children: [
              // اولی اون اسم های بالا
              Padding(
                padding: EdgeInsets.fromLTRB(
                    Get.width / MyPadings.profcardpaddingfromedgws,
                    10,
                    Get.width / MyPadings.profcardpaddingfromedgws,
                    20),
                child: Container(
                  decoration: MyDecorations.cardgradient,
                  height: Get.height / 8,
                  width: double.maxFinite,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: MyPadings.padingforprofimage,
                        child: Container(
                          height: (Get.height / Sizes.profimagehight),
                          width: (Get.height / Sizes.profimagehight),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              color: SolidColors.profimagebackcolor),
                          child: const FittedBox(
                            fit: BoxFit.contain,
                            child: Icon(
                              Icons.person,
                              color: SolidColors.profimageiconcolor,
                            ),
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Padding(
                          padding: MyPadings.padingforprofinfo,
                          child: Center(
                              child: Column(
                            children: [
                              Text(
                                name,
                                style: profnamestyle,
                              ),
                              // Text(
                              //   addres,
                              //   style: profinfostyle,
                              // ),
                              Text(
                                email,
                                style: profinfostyle,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // اون قسمت ک توش رای میدی
              Padding(
                padding: EdgeInsets.fromLTRB(
                    Get.width / MyPadings.profcardpaddingfromedgws,
                    10,
                    Get.width / MyPadings.profcardpaddingfromedgws,
                    20),
                child: Container(
                  decoration: MyDecorations.cardgradient,
                  // height: Get.height / 8,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Column(
                      children: [
                        Ratefac1(factor: MyStrings.facs1 , fn: 'f1',),
                        Ratefac1(factor: MyStrings.facs2 , fn: 'f2',),
                        Ratefac1(factor: MyStrings.facs3 , fn: 'f3',),
                        Ratefac1(factor: MyStrings.facs4 , fn: 'f4',),
                        Ratefac1(factor: MyStrings.facs5 , fn: 'f5',),
                        Ratefac1(factor: MyStrings.facs6 , fn: 'f6',),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 50,
            left: 50,
            right: 50,
            child: InkWell(
              onTap: () async{
              print(Uri.parse(ApiUrlConstant.urlrateprofs + id));
                final response = await http.patch(
              Uri.parse('${ApiUrlConstant.urlrateprofs}$id/'),
              headers: <String, String>{
                'Content-Type': 'application/json',
              },
              body: jsonEncode(serversend),);
              
    if (response.statusCode == 200) {
                Get.back();
                List listdata = box.read('rated')??[];
                listdata.add(int.parse(id));
                box.writeIfNull("rated", listdata);
                Get.snackbar(
              '',
              ' اطلاعات با موفقیت ارسال شد',
              snackPosition: SnackPosition.TOP,
              
            );

    }
    else{
Get.back();
Get.snackbar(
              '',
              ' اطلاعات با موفقیت ارسال نشد',
              snackPosition: SnackPosition.TOP,
              
            );
    }
              },
              child: Container(
                height: Get.height / 12,
                // width: 400,
                decoration: MyDecorations.cardgradient,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Text(
                      ' تایید و ثبت اطلاعات',
                      style: smaltext,
                    ),
                  ),
                ),
              ),
            ))
      ],
    ));
  }
}

// ignore: must_be_immutable
class Ratefac1 extends StatelessWidget {
  Ratefac1({super.key, required this.factor, required this.fn});
  String factor;
  String fn;
  RxDouble sliderValue = 3.0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            SizedBox(
              width: Get.width / 7,
              // height: Get.width / 8,

              child: Text(
                factor,
                textAlign: TextAlign.center,
                // style: smaltext,
              ),
            ),
            Expanded(
              child: SliderTheme(
                data: SliderThemeData(
                    activeTickMarkColor: Colors.green[400],
                    activeTrackColor: sliderValue.value == 2.0
                        ? Colors.red
                        : sliderValue.value == 3.0
                            ? Colors.orange
                            : sliderValue.value == 4.0
                                ? Colors.yellow
                                : Colors.green,
                    inactiveTickMarkColor: Colors.black,
                    thumbColor: Colors.green[300],
                    tickMarkShape:
                        const RoundSliderTickMarkShape(tickMarkRadius: 5)),
                child: Slider(
                  label: sliderValue.value == 1.0
                      ? "بد"
                      : sliderValue.value == 2.0
                          ? 'ضعیف'
                          : sliderValue.value == 3.0
                              ? "متوسط"
                              : sliderValue.value == 4.0
                                  ? "خوب"
                                  : "عالی",
                  value: sliderValue.value,
                  onChanged: (value) {
                    // تغییر مقدار اسلایدر با دست کاربر
                    sliderValue.value = value;
                    serversend.value[fn] = value*90/4-12.5;
                  },
                  min: 1,
                  max: 5,
                  divisions: 4, // تعداد پله‌ها (مقادیر گسسته)
                ),
              ),
            ),
            SizedBox(
              width: Get.width / 10,
              height: Get.height / 18,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  sliderValue.value == 1.0
                      ? "بد"
                      : sliderValue.value == 2.0
                          ? 'ضعیف'
                          : sliderValue.value == 3.0
                              ? "متوسط"
                              : sliderValue.value == 4.0
                                  ? "خوب"
                                  : "عالی",
                ),
              ),
            )
          ],
        ));
  }
  
}
