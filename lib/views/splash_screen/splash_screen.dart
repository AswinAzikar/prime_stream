import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prime_stream/gen/assets.gen.dart';
import 'package:prime_stream/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward();
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateBasedOnPreference();
      }
    });

    // Start the preference check
    _initializePreferences();
  }

  Future<void> _initializePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool("_isFirstTime") ?? true;

    // Use the value during navigation
    _navigateBasedOnPreference(isFirstTime: isFirstTime);
  }

  void _navigateBasedOnPreference({bool? isFirstTime}) {
    if (isFirstTime == true) {
      Get.toNamed(AppRoutes.landingScreen);
    } else {
      Get.toNamed(AppRoutes.navigationScreen);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: SvgPicture.asset(Assets.svgs.primeStreamLogo),
            );
          },
        ),
      ),
    );
  }
}
