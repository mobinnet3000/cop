import 'package:flutter/cupertino.dart';

import '../constant/my_colors.dart';

class MyDecorations {
  MyDecorations._();

  static BoxDecoration mainGradient = const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(18)),
    gradient: LinearGradient(
      colors: GradientColors.splashgrad,
    ),
  );
  static BoxDecoration cardgradient = const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(25)),
    gradient: LinearGradient(
      colors: GradientColors.cardgradintcolor,
      begin: Alignment.centerRight
      ,end: Alignment.centerLeft
    ),
  );static BoxDecoration cardonegradient = const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(25)),
    gradient: LinearGradient(
      colors: GradientColors.cardgradintcolor,
      begin: Alignment.topCenter
      ,end: Alignment.bottomCenter
    ),
  );
  static BoxDecoration backgradient =  const BoxDecoration(
              gradient: LinearGradient(
            colors: GradientColors.mainbackgrand, // رنگ‌های گرادیانت
            begin: Alignment.topCenter, // شروع از بالا و مرکز
            end: Alignment.bottomCenter, // پایان در پایین و مرکز)),
          ));
}
