import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prime_stream/gen/assets.gen.dart';
import 'package:prime_stream/utils/size_utils.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NaviationScreenState();
}

class _NaviationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: SizedBox(
          width: 60.h,
          height: 60.h,
          child: SvgPicture.asset(
            Assets.svgs.primeStreamLogo,
            fit: BoxFit.contain,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text("Nav screeen"),
      ),
    );
  }
}
