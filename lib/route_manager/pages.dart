import 'package:get/get_navigation/src/routes/get_route.dart';
import '../view/main/main_screen.dart';
import '../view/splash/splash_screen.dart';
import 'names.dart';

class Pages{

  Pages._();

  static List<GetPage<dynamic>>  pages =  [
          GetPage(
              name: NamedRoute.initialRoute,
              page: () =>  const SplashScreen(),
            ),
            GetPage(
              name: NamedRoute.routeMainScreen,
              page: () => const MainScreen(),
            ),
            // GetPage(
            //   name: NamedRoute.lessonScreen,
            //   page: () => const LessonScreen(),
            // ),
            // GetPage(
            //   name: NamedRoute.settingScreen,
            //   page: () =>  SettingScreen(),
            // )
        ];


}