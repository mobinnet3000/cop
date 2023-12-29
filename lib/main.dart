import 'dart:io';
import 'package:cop/route_manager/names.dart';
import 'package:cop/route_manager/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'my_http_overrides.dart';


Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();

  await GetStorage.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.black,
      theme: ThemeData(),
      locale: const Locale('fa'),
      // theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      getPages: Pages.pages,
      initialRoute: NamedRoute.initialRoute,
    );
  }
}
