import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:prime_stream/views/home_screen.dart';
import 'package:prime_stream/views/landing_screen.dart';

import '../views/navigation_screen.dart';

class AppRoutes {
  static const navigationScreen = '/navigationScreen' ;
static const landingScreen = '/landingScreen';

  static final List<GetPage> pages = [
    GetPage(
      name: landingScreen,
      page: () => const LandingScreen(),
    ),
    GetPage(
      name: navigationScreen,
      page: () => const NavigationScreen(),
    )
  ];
}
