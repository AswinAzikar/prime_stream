import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:prime_stream/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:prime_stream/constants/constants.dart';
import 'package:prime_stream/extensions/font_extension.dart';
import 'package:prime_stream/gen/assets.gen.dart';
import 'package:prime_stream/utils/size_utils.dart';
import '../widgets/neo_button.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool _isFirstTime = true;

  @override
  void initState() {
    super.initState();
    _initializeFirstTimeState();
  }

  Future<void> _initializeFirstTimeState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isFirstTime = prefs.getBool("_isFirstTime") ?? true;
    });
  }

  Future<void> _changeLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("_isFirstTime", false);
    setState(() {
      _isFirstTime = false;
    });
    Get.toNamed(AppRoutes.splashScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softBlack,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              Assets.jpgs.landingImage.path,
              fit: BoxFit.cover,
              height: SizeUtils.height,
              width: SizeUtils.width,
            ),
          ),

          // Gradient Overlay
          Positioned(
            bottom: 0,
            child: SvgPicture.asset(
              Assets.svgs.gradeintCover,
              width: SizeUtils.width,
            ),
          ),

          // Main Content
          Positioned(
            left: 0,
            right: 0,
            bottom: SizeUtils.height / 10,
            child: Column(
              children: [
                Gap(20.fSize),
                NeoButton(
                  text: "Get Started!",
                  onTapDown: _changeLoginState,
                ),
                Gap(paddingXL.fSize),
              ],
            ),
          ),

          // Animated Text
          Positioned(
            left: 20,
            top: SizeUtils.height / 3,
            child: DefaultTextStyle(
              style: context.netflixSansLight.copyWith(
                fontSize: 40.fSize,
                color: Colors.white,
                fontWeight: FontWeight.w100,
              ),
              child: SizedBox(
                width: SizeUtils.width - 40, // Adjusted for padding
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      "Stream\nMovies and Series\nanywhere\nfor free.",
                      textAlign: TextAlign.start,
                    ),
                  ],
                  repeatForever: false,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
