import 'package:cop/components/text_style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../constant/my_colors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}



class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitSpinningLines(
      color: SolidColors.primaryColor,
      size: 32.0,
    );
  }
}
PreferredSize appBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(
                child: Text(
              title,
              style: appBarTextStyle,
            )),
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: SolidColors.primaryColor.withBlue(100),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.keyboard_arrow_right_rounded),
            ),
          ),
        ),
      ),
    ),
  );
}

// ignore: must_be_immutable
class Tabcanti extends StatelessWidget {
  String? tex ;

  Tabcanti({
    super.key,
    required this.tex ,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black
      ,borderRadius: BorderRadius.circular(15
      )),child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
        child: Text(tex.toString()),
      ),
    );
  }
}