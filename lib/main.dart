import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:prime_stream/routes/app_routes.dart';
import 'package:prime_stream/theme/theme.dart';
import 'package:prime_stream/utils/size_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: normalTheme,
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.pages,
      builder: (context, child) => Sizer(
        builder: (context, orientation, deviceType) {
          return child ?? const SizedBox();
        },
      ),
    );
  }
}
