import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:prime_stream/constants/constants.dart';
import 'package:prime_stream/gen/assets.gen.dart';

import 'package:prime_stream/utils/size_utils.dart';

import '../widgets/neo_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softBlack,
      body: Column(
        children: [
          Stack(
            children: [
              Expanded(
                child: Image.asset(
                  height: SizeUtils.height,
                  fit: BoxFit.cover,
                  Assets.jpgs.landingImage.path,
                  // height: SizeUtils.height
                ),
              ),
              Positioned(
                  // left: 0,
                  // right: 0,
                  bottom: 0,
                  child: SvgPicture.asset(
                    Assets.svgs.gradeintCover,
                    width: SizeUtils.width,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
