import 'package:flutter/material.dart';

extension FontExtension on BuildContext {
  TextStyle get netflixSansBold {
    return const TextStyle(
      fontFamily: 'NetflixSans',
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get netflixSansMedium {
    return const TextStyle(
      fontFamily: 'NetflixSans',
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle get netflixSansLight {
    return const TextStyle(
      fontFamily: 'NetflixSans',
      fontWeight: FontWeight.w300,
    );
  }

  TextStyle get titleText {
    return netflixSansBold.copyWith(
      fontSize: 32,
    );
  }

  TextStyle get subheadingText {
    return netflixSansMedium.copyWith(
      fontSize: 24,
    );
  }

  TextStyle get bodyText {
    return netflixSansMedium.copyWith(
      fontSize: 16,
    );
  }

  TextStyle get secondaryText {
    return netflixSansMedium.copyWith(
      fontSize: 14,
    );
  }

  TextStyle get buttonText {
    return netflixSansMedium.copyWith(
      fontSize: 18,
    );
  }

  TextStyle get captionText {
    return netflixSansLight.copyWith(
      fontSize: 12,
    );
  }
}
