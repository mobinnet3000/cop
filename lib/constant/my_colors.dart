import 'package:flutter/material.dart';

class SolidColors {
  static const Color tabselectcolor = Colors.black;
  static const Color iconscolor = Colors.black;
  static const Color profimagebackcolor = Colors.white;
  static const Color profimageiconcolor = Colors.black;
  static const Color dividerColor = Color.fromARGB(255, 112, 112, 112);
  static const Color rateiconcolor = Color.fromARGB(255, 0, 0, 0);
  static const Color facstextcolor = Color.fromARGB(255, 0, 0, 0);
  static const Color facsbordercolor = Colors.black54;
  static const Color facsbackrcolor = Colors.grey;

static AlwaysStoppedAnimation<Color> fac({required facs}) {return AlwaysStoppedAnimation<Color>(
                        facs <= 0.33
                            ? const Color.fromARGB(255, 182, 12, 0)
                            : facs <= 0.66
                                ? const Color.fromARGB(255, 255, 179, 0)
                                : Colors.green,
                      );}





  static const Color posterSubTitle = Color.fromARGB(200, 255, 255, 255);
  static const Color posterTitle = Color.fromARGB(255, 255, 255, 255);
  static const Color primaryColor = Color.fromARGB(255, 39, 2, 50);
  static const Color colorTitle = Color.fromARGB(255, 40, 107, 184);
  static const Color textTitle = Color.fromARGB(255, 0, 0, 0);
  static const Color scaffoldBg = Color.fromARGB(255, 255, 255, 255);
  static const Color statusBarColor = Color.fromARGB(255, 255, 255, 255);
  static const Color systemNavigationBarColor =
      Color.fromARGB(255, 255, 255, 255);
  static const Color lightText = Color.fromARGB(255, 255, 255, 255);
  static const Color selectedPodCast = Color.fromARGB(255, 255, 139, 26);
  static const Color submitArticle = Color.fromARGB(255, 209, 209, 209);
  static const Color submitPodCast = Color.fromARGB(255, 246, 246, 246);
  static const Color subText = Color.fromARGB(255, 197, 197, 197);
  static const Color hashTag = Color.fromARGB(255, 255, 255, 255);
  static const Color seeMore = Color.fromARGB(255, 40, 107, 184);
  static const Color hintText = Color.fromARGB(255, 133, 133, 133);
  static const Color surface = Color.fromARGB(255, 242, 242, 242);
  static const Color greyColor = Color.fromARGB(255, 156, 156, 156);
  static const Color lightIcon = Color.fromARGB(255, 255, 255, 255);
  static const Color blackColor = Color.fromARGB(255, 4, 4, 4);
  static const Color yelowColor = Color.fromARGB(255, 255, 235, 59);
  static const Color erorColor = Color.fromARGB(255, 227, 10, 10);
  static const Color lightBackColor = Color.fromARGB(255, 255, 255, 255);
  static const Color minutesColorColor = Color.fromARGB(255, 203, 202, 202);
}

class GradientColors {
  static const List<Color> splashgrad = [
    Color.fromARGB(255, 71, 51, 9), // رنگ بالا
    Color.fromARGB(255, 209, 150, 30),
  ];
  static const List<Color> appbar = [
    Color.fromARGB(255, 112, 112, 111),
    Color.fromARGB(255, 190, 192, 194),
    ];
  // ];  static const List<Color> appbar = [
  //   Color.fromARGB(255, 254, 0, 119),
  //   Color.fromARGB(255, 75, 62, 88), // رنگ بالا
  // ];  
  static const List<Color> mainbackgrand = [
    Color.fromARGB(255, 83, 83, 83),
    Color.fromARGB(255, 0,0,0), // رنگ بالا
  ];  
  static const List<Color> cardgradintcolor = [
    Color.fromARGB(255, 255, 232, 62),
    Color.fromARGB(255, 124,90,23), // رنگ بالا
  ];
}
