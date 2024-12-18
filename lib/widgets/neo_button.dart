import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/neopop.dart';
import 'package:prime_stream/extensions/font_extension.dart';
import 'package:prime_stream/utils/size_utils.dart';

import '../constants/constants.dart';

class NeoButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTapUp;
  final VoidCallback? onTapDown;

  const NeoButton({
    super.key,
    required this.text,
    this.onTapDown,
    this.onTapUp,
  });

  @override
  Widget build(BuildContext context) {
    return NeoPopButton(
      onTapUp: () {
        HapticFeedback.selectionClick();
        onTapUp?.call();
      },
      onTapDown: () {
        HapticFeedback.lightImpact();
        onTapDown?.call();
      },
      border: Border.all(
        style: BorderStyle.solid,
      ),
      grandparentColor: Colors.yellow,
      disabledColor: Colors.white,
      color: Colors.white,
      parentColor: Colors.yellow,
      animationDuration: Durations.medium3,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        padding: EdgeInsets.symmetric(vertical: 15.fSize, horizontal: 35.fSize),
        child: Text(
          text,
          style: context.netflixSansBold.copyWith(fontSize: 20.fSize),
        ),
      ),
    );
  }
}
