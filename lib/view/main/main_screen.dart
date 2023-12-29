import 'package:cop/components/text_style.dart';
import 'package:cop/constant/my_colors.dart';
import 'package:cop/constant/my_strings.dart';
import 'package:cop/models/lesson_model.dart';
import 'package:cop/view/main/lesson_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/mdecoratons.dart';
import '../../components/my_component.dart';
import '../../controller/home_screen_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen>
    with TickerProviderStateMixin<MainScreen> {
  TabController? cont;
  // تعریف کنترلر برای دریافت اطلاعات از api
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // برای لودینگ صفحه
      if (homeScreenController.loading.value == true) {
        return const MainScreenAppbarFull(
            mainbody: Scaffold(
          body: Center(
            child: Loading(),
          ),
        ));
      } else {
        cont = TabController(
            // ignore: invalid_use_of_protected_member
            length: homeScreenController.tabList.value.length,
            vsync: this);
        return MainScreenAppbarFull(
          mainbody: MainScreenBody(
              cont: cont, homeScreenController: homeScreenController),
        );
      }
    });
  }
}

class MainScreenAppbarFull extends StatelessWidget {
  final Widget mainbody;
  const MainScreenAppbarFull({super.key, required this.mainbody});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // تعریف دراور که از بغل میاد
        drawer: Container(
          decoration: MyDecorations.backgradient,
          width: Get.width / 2,
        ),
        // تعریف اپبار بالا صفحه
        appBar: AppBar(
          iconTheme: const IconThemeData(color: SolidColors.iconscolor),
          // تعریف ایکون های بالای صفحه
          actions: [
            // Padding(
            //   padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            //   child: IconButton(
            //     icon: Icon(Icons.settings,color: Colors.black,),
            //     onPressed: () {
            //       Get.to(SettingScreen());
            //     },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            )
          ],
          title: Column(
            children: [
              const Text(
                MyStrings.projectshortname,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                MyStrings.projectfultnamepr,
                style: appbartext,
              )
            ],
          ),
          centerTitle: true,
          flexibleSpace: Container(
            // تعریف رنگ اپ بار
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: GradientColors.appbar,
                begin: Alignment.topCenter, // شروع از بالا و مرکز
                end: Alignment.bottomCenter, // پایان در پایین و مرکز
              ),
            ),
          ),
        ),
        // کل بادی که قراره بگیری
        body: mainbody);
  }
}

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({
    super.key,
    required this.cont,
    required this.homeScreenController,
  });

  final TabController? cont;
  final HomeScreenController homeScreenController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        // رنگ بکگراند
        decoration: MyDecorations.backgradient,
        //طراحی ویجت های روی صفحه
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: Column(children: [
            //طراحی تب بار بالای صفحه برای ترم های مختلف
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: TabBar(
                  automaticIndicatorColorAdjustment: true,
                  indicator: BoxDecoration(
                      color: SolidColors.tabselectcolor,
                      borderRadius: BorderRadius.circular(20)),
                  isScrollable: true,
                  controller: cont,
                  // ignore: invalid_use_of_protected_member
                  tabs: homeScreenController.tabList.value),
            ),
            //تب بار تموم میشه
            const SizedBox(
              height: 10,
            ),
            //تب بار ویوو رو اینجا میزاریم
            Expanded(
              child: TabBarView(
                  controller: cont,
                  children:
                      //تب ویو از اینجا شروع میشه
                      // ignore: invalid_use_of_protected_member
                      homeScreenController.alltermList.value
                  //پایان تب ویوو
                  ),
            )
          ]),
        ),
      );
    });
  }
}

class CardsForAllLessens extends StatelessWidget {
  final List<LessonModel> alltermlesson;

  const CardsForAllLessens({
    super.key,
    required this.alltermlesson,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: alltermlesson.length, // تعداد موارد در لیست
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      itemBuilder: (context, index) {
        return CardForEachLesson(
          title: alltermlesson[index].title,
          cologe: alltermlesson[index].cologe,
          vahed: alltermlesson[index].vahed,
          img: alltermlesson[index].imageUrl,
          id: alltermlesson[index].id,
        );
      },
    );
  }
}

class CardForEachLesson extends StatelessWidget {
  final String id;
  final String title;
  final String cologe;
  final String vahed;
  final String img;
  const CardForEachLesson({
    super.key,
    required this.title,
    required this.cologe,
    required this.vahed,
    required this.img,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width / 10, 10, size.width / 10, 20),
      child: InkWell(
        onTap: () {
          Get.to(LessonScreen(
            id: id,
            name: title,
          ));
        },
        child: Container(
          decoration: MyDecorations.cardgradient,
          height: size.height / 7,
          width: double.maxFinite,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Container(
                      height: (size.height / 8) - 30,
                      width: (size.height / 8) - 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: size.width / 3.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Wrap(children:[ Text(lesen, style: lessontext,)]),
                        FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              title,
                              style: lessontext,
                              overflow: TextOverflow.fade,
                            )),
                        Text(cologe),
                        Text('$vahed واحد'),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FittedBox(
                            fit: BoxFit.contain,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: size.height / 12,
                            )),
                      ),
                    ],
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
