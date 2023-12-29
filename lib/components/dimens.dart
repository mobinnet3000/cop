
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimens {

  static double bodyMargin = Get.width/10;
  static double halfBodyMargin = (Get.width/10)/2;
  
  static double small = 8.0;
  static double xsmall = 14.0;
  static double medium = 16.0;
  static double large = 24.0;
  static double xlarge = 64.0;
  static double xxlarge = 150.0;
}


class Sizes {

  static double padingfromphoneedge = 8.0;
  static double profcardsheight = 3.3;
  static double profimagehight = 12;
  static double profcardleftwi = 6;
  static double rateiconsize = 18;
  static double small = 8.0;
static double medium = 50;
  static double large = 32.0;
  static double xlarge = 64.0;
  static double xxlarge = 150.0;
}
class MyPadings{
  static EdgeInsetsGeometry padingfromphoneedge = const EdgeInsets.all(10);
  static EdgeInsetsGeometry padingforallprofccarts = const EdgeInsets.fromLTRB(0, 20, 0, 0);
  static EdgeInsetsGeometry padingforprofimage = const EdgeInsets.fromLTRB(15,15,15,15);
  static EdgeInsetsGeometry padingforprofinfo= const EdgeInsets.fromLTRB(0,15,0,0);
  static EdgeInsetsGeometry padingforprofcarddivider= const EdgeInsets.fromLTRB(3, 10, 3, 10);
  static EdgeInsetsGeometry padingforprofcardleft= const EdgeInsets.fromLTRB(0, 10, 0, 10);
  static EdgeInsetsGeometry padingforprofcardfactorspersent= const EdgeInsets.fromLTRB(8, 1, 8, 2);
  static double profcardpaddingfromedgws = 10;
}

class MyTimes {
  static Duration aminforfactors = const Duration(seconds: 4);
}