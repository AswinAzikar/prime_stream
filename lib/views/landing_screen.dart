import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
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
  // ignore: unused_field
  bool _isFirstTime = true;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _changeLoginState() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool("_isFirstTime", false);

    setState(() {
      _isFirstTime = false;
    });
    // Logger().e("Navigating to the Navigation Screen");
    Get.toNamed(AppRoutes.navigationScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softBlack,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.jpgs.landingImage.path,
              fit: BoxFit.cover,
              height: SizeUtils.height,
              width: SizeUtils.width,
            ),
          ),
          Positioned(
            bottom: 0,
            child: SvgPicture.asset(
              Assets.svgs.gradeintCover,
              width: SizeUtils.width,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: SizeUtils.height / 10,
            child: Column(
              children: [
                Gap(20.fSize),
                NeoButton(
                  text: "Get Started!",
                  onTapDown: () {
                    _changeLoginState();
                  },
                ),
                Gap(paddingXL.fSize),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: SizeUtils.height / 3,
            child: DefaultTextStyle(
              style: context.netflixSansLight.copyWith(
                  fontSize: 40.fSize,
                  color: Colors.white,
                  fontWeight: FontWeight.w100),
              child: SizedBox(
                width: SizeUtils.width,
                child: Row(
                  children: [
                    Divider(
                      thickness: 2.fSize,
                      color: Colors.white,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(
                                    " Stream\n Movies and Series\n anywhere\n for free. "),
                              ],
                              repeatForever: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
