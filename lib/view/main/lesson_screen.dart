import 'package:cop/components/my_component.dart';
import 'package:cop/controller/lessonscreen_controller.dart';
import 'package:cop/view/rate/rate_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../components/dimens.dart';
import '../../components/mdecoratons.dart';
import '../../components/text_style.dart';
import '../../constant/my_colors.dart';
import '../../constant/my_strings.dart';
import 'main_screen.dart';

// ignore: must_be_immutable
class LessonScreen extends StatefulWidget {
  String id;
  String name;
  LessonScreen({super.key, required this.id, required this.name});
  @override
  // ignore: no_logic_in_create_state
  State<LessonScreen> createState() => LessonScreenState(id: id);
}

class LessonScreenState extends State<LessonScreen>
    with TickerProviderStateMixin {
  String id;
  LessonScrennController? lessonScrennController;

  LessonScreenState({required this.id}) {
    lessonScrennController = Get.put(LessonScrennController(id: id));
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MainScreenAppbarFull(
        mainbody: ProfScreenAppbarFull(
            mainbody: lessonScrennController!.loading.value == true
                ? const Center(
                    child: Loading(),
                  )
                : ProfScreenBody(
                    wi: Get.width,
                    he: Get.height,
                    name: widget.name,
                    lessonScrennController: lessonScrennController,
                  )),
      );
    });
  }
}

class ProfScreenAppbarFull extends StatelessWidget {
  const ProfScreenAppbarFull({
    super.key,
    required this.mainbody,
  });
  final Widget mainbody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: mainbody);
  }
}

// ignore: must_be_immutable
class ProfScreenBody extends StatelessWidget {
  final double wi;
  final double he;
  String name;
  LessonScrennController? lessonScrennController;

  ProfScreenBody(
      {super.key,
      required this.wi,
      required this.he,
      required this.name,
      required this.lessonScrennController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: MyDecorations.backgradient,
      //طراحی ویجت های روی صفحه
      child: Padding(
        padding: MyPadings.padingfromphoneedge,
        child: Column(children: [
          //طراحی اسم درس بالای صفحه
          Container(
            height: he / 12,
            width: double.maxFinite,
            decoration: MyDecorations.cardgradient,
            child: Center(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  name,
                  style: lessonnameforprofpagetext,
                ),
              ),
            ),
          ),
          //کارت بالای صفجه تموم میشه
          const SizedBox(
            height: 10,
          ),
          //اسم استادا شروع میشه
          Expanded(
            child: CardsForAllProf(
                // ignore: invalid_use_of_protected_member
                alltermprof: lessonScrennController!.mainproflist.value),
          )
        ]),
      ),
    );
  }
}

class CardsForAllProf extends StatefulWidget {
  final List<Map<String, dynamic>> alltermprof;

  const CardsForAllProf({
    super.key,
    required this.alltermprof,
  });

  @override
  State<CardsForAllProf> createState() => _CardsForAllProfState();
}

class _CardsForAllProfState extends State<CardsForAllProf>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> progressAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: MyTimes.aminforfactors, // مدت زمان انیمیشن
    );

    progressAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut, // نوع انیمیشن
    );

    _animationController.forward(); // شروع انیمیشن
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.alltermprof.length, // تعداد موارد در لیست
      padding: MyPadings.padingforallprofccarts,
      itemBuilder: (context, index) {
        return CardForEachprof(
          progressAnimation: progressAnimation,
          name: widget.alltermprof[index]['name'],
          // addres: widget.alltermprof[index]['addres'],
          email: widget.alltermprof[index]['email'],
          factors: [
            widget.alltermprof[index]['f1'] / 100,
            widget.alltermprof[index]['f2'] / 100,
            widget.alltermprof[index]['f3'] / 100,
            widget.alltermprof[index]['f4'] / 100,
            widget.alltermprof[index]['f5'] / 100,
            widget.alltermprof[index]['f6'] / 100,
          ],
          img: widget.alltermprof[index]['imageUrl'] ?? 'imgurl',
          id: widget.alltermprof[index]['id'].toString(),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class CardForEachprof extends StatelessWidget {
  final String id;
  final String name;
  // final String addres;
  final String email;
  final String img;
  final List<double> factors;
  Animation<double> progressAnimation;

  CardForEachprof({
    super.key,
    required this.id,
    required this.name,
    // required this.addres,
    required this.email,
    required this.img,
    required this.factors,
    required this.progressAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          size.width / MyPadings.profcardpaddingfromedgws,
          10,
          size.width / MyPadings.profcardpaddingfromedgws,
          20),
      child: Container(
        decoration: MyDecorations.cardgradient,
        height: size.height / Sizes.profcardsheight,
        width: double.maxFinite,
        child: Row(
          children: [
            //قسمت راست کارت
            Expanded(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Column(children: [
                  //قسمت بالایی راست
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: MyPadings.padingforprofimage,
                        child: Container(
                          height: (size.height / Sizes.profimagehight),
                          width: (size.height / Sizes.profimagehight),
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
                      Padding(
                        padding: MyPadings.padingforprofinfo,
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
                        ),
                      ),
                    ],
                  ),
                  // قسمت پایینی راست
                  Factors(
                    progressAnimation: progressAnimation,
                    facs: factors,
                  )
                ]),
              ),
            ),
            //دیوایدر را ساختم
            Padding(
              padding: MyPadings.padingforprofcarddivider,
              child: Container(
                width: 4,
                height: double.maxFinite,
                color: SolidColors.dividerColor,
              ),
            ),
            //پایان دیوایدر
            InkWell(
              onTap: () {

                if ((box.read('rated') ?? []).contains(int.parse(id))) {
                  Get.snackbar(
              'خطا',
              'به هر استاد یک بار امکان نمره دادن وجود دارد',
              snackPosition: SnackPosition.TOP,);
                } else {
                  Get.to(RateScreen(
                    name: name,
                    id: id,
                    email: email,
                  ));
                }
              },
              child: Padding(
                padding: MyPadings.padingforprofcardleft,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: SizedBox(
                    width: size.width / Sizes.profcardleftwi,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              MyStrings.rateprof,
                              style: smaltext,
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: size.height / Sizes.rateiconsize,
                              color: SolidColors.rateiconcolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Factors extends StatelessWidget {
  Animation<double> progressAnimation;
  List<double> facs;
  Factors({super.key, required this.progressAnimation, required this.facs});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            SizedBox(
              height: size.height / 50,
            ),
            SizedBox(
                height: 20,
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      MyStrings.facs1,
                      style: facstext,
                    ))),
            SizedBox(
              height: size.height / 70,
            ),
            SizedBox(
                height: 20,
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      MyStrings.facs2,
                      style: facstext,
                    ))),
            SizedBox(
              height: size.height / 70,
            ),
            SizedBox(
                height: 20,
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      MyStrings.facs3,
                      style: facstext,
                    ))),
            SizedBox(
              height: size.height / 70,
            ),
            SizedBox(
                height: 20,
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      MyStrings.facs4,
                      style: facstext,
                    ))),
            SizedBox(
              height: size.height / 70,
            ),
            SizedBox(
                height: 20,
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      MyStrings.facs5,
                      style: facstext,
                    ))),
            SizedBox(
              height: size.height / 70,
            ),
            SizedBox(
                height: 20,
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      MyStrings.facs6,
                      style: facstext,
                    ))),
            SizedBox(
              height: size.height / 70,
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: size.height / 50,
            ),
            Padding(
              padding: MyPadings.padingforprofcardfactorspersent,
              child: Container(
                width: 200,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: SolidColors.facsbordercolor, width: 2),
                ),
                child: AnimatedBuilder(
                  animation: progressAnimation,
                  builder: (context, child) {
                    double progress = progressAnimation.value * facs[0];
                    double factor = facs[0];
                    return Stack(children: [
                      LinearProgressIndicator(
                          minHeight: 15,
                          value: progress,
                          backgroundColor: SolidColors.facsbackrcolor,
                          valueColor: SolidColors.fac(facs: factor)),
                      Center(
                          child: Text(
                        '${factor * 100}%',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w900),
                      ))
                    ]);
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height / 70,
            ),
            const SizedBox(
              height: 1,
            ),
            Padding(
              padding: MyPadings.padingforprofcardfactorspersent,
              child: Container(
                width: 200,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: SolidColors.facsbordercolor, width: 2),
                ),
                child: AnimatedBuilder(
                  animation: progressAnimation,
                  builder: (context, child) {
                    double progress = progressAnimation.value * facs[1];
                    double factor = facs[1];
                    return Stack(children: [
                      LinearProgressIndicator(
                          minHeight: 15,
                          value: progress,
                          backgroundColor: SolidColors.facsbackrcolor,
                          valueColor: SolidColors.fac(facs: factor)),
                      Center(
                          child: Text(
                        '${factor * 100}%',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w900),
                      ))
                    ]);
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height / 70,
            ),
            const SizedBox(
              height: 1,
            ),
            Padding(
              padding: MyPadings.padingforprofcardfactorspersent,
              child: Container(
                width: 200,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: SolidColors.facsbordercolor, width: 2),
                ),
                child: AnimatedBuilder(
                  animation: progressAnimation,
                  builder: (context, child) {
                    double progress = progressAnimation.value * facs[2];
                    double factor = facs[2];
                    return Stack(children: [
                      LinearProgressIndicator(
                          minHeight: 15,
                          value: progress,
                          backgroundColor: SolidColors.facsbackrcolor,
                          valueColor: SolidColors.fac(facs: factor)),
                      Center(
                          child: Text(
                        '${factor * 100}%',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w900),
                      ))
                    ]);
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height / 70,
            ),
            const SizedBox(
              height: 1,
            ),
            Padding(
              padding: MyPadings.padingforprofcardfactorspersent,
              child: Container(
                width: 200,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: SolidColors.facsbordercolor, width: 2),
                ),
                child: AnimatedBuilder(
                  animation: progressAnimation,
                  builder: (context, child) {
                    double progress = progressAnimation.value * facs[3];
                    double factor = facs[3];
                    return Stack(children: [
                      LinearProgressIndicator(
                          minHeight: 15,
                          value: progress,
                          backgroundColor: SolidColors.facsbackrcolor,
                          valueColor: SolidColors.fac(facs: factor)),
                      Center(
                          child: Text(
                        '${factor * 100}%',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w900),
                      ))
                    ]);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            SizedBox(
              height: size.height / 70,
            ),
            Padding(
              padding: MyPadings.padingforprofcardfactorspersent,
              child: Container(
                width: 200,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: SolidColors.facsbordercolor, width: 2),
                ),
                child: AnimatedBuilder(
                  animation: progressAnimation,
                  builder: (context, child) {
                    double progress = progressAnimation.value * facs[4];
                    double factor = facs[4];
                    return Stack(children: [
                      LinearProgressIndicator(
                          minHeight: 15,
                          value: progress,
                          backgroundColor: SolidColors.facsbackrcolor,
                          valueColor: SolidColors.fac(facs: factor)),
                      Center(
                          child: Text(
                        '${factor * 100}%',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w900),
                      ))
                    ]);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            SizedBox(
              height: size.height / 70,
            ),
            Padding(
              padding: MyPadings.padingforprofcardfactorspersent,
              child: Container(
                width: 200,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: SolidColors.facsbordercolor, width: 2),
                ),
                child: AnimatedBuilder(
                  animation: progressAnimation,
                  builder: (context, child) {
                    double progress = progressAnimation.value * facs[5];
                    double factor = facs[5];
                    return Stack(children: [
                      LinearProgressIndicator(
                          minHeight: 15,
                          value: progress,
                          backgroundColor: SolidColors.facsbackrcolor,
                          valueColor: SolidColors.fac(facs: factor)),
                      Center(
                          child: Text(
                        '${factor * 100}%',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w900),
                      ))
                    ]);
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height / 70,
            ),
          ],
        ),
      ],
    );
  }
}
