import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:prime_stream/views/home_screen.dart';
import 'package:prime_stream/views/landing_screen.dart';

class AppRoutes {
  static const home = '/';
  static const landingScreen = '/LandingScreen';

  final List<GetPage> pages = [
    GetPage(
      name: landingScreen,
      page: () => const LandingScreen(),
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
    )
  ];
}
