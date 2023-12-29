import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cop/components/dimens.dart';
import 'package:cop/components/text_style.dart';
import 'package:cop/constant/adress.dart';
import 'package:cop/constant/my_colors.dart';
import 'package:cop/constant/my_strings.dart';
import '../../route_manager/names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.offAndToNamed(NamedRoute.routeMainScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // رنگ پس زمینه
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: GradientColors.splashgrad,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            width: 1,
            height: 1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // عناصر موجود در صفحه از اینجا شروع میشه
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.projectshortname,
                    style: xlargetext,
                  ),
                ],
              ),
              Text(
                MyStrings.projectfultname,
                style: mediomtext,
              ),
              Text(
                MyStrings.projectfultnamepr,
                style: mediomtext,
              ),
              Text(
                MyStrings.owner,
                style: mediomtext1,
              ),
              Text(
                'لطفا از اتصال اینترنت خود اطمینان حاصل نمایید',
                style: mediomtext,
              ),
              Image.asset(
                Myaddress.amirkabirpath,
                width: Sizes.medium,
                height: Sizes.medium,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
