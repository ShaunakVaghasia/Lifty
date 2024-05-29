import 'package:flutter/material.dart';

class UiConstants {
  static const String exercise = 'exercise';
  static const String weight = 'weight';
  static const String sets = 'sets';
  static const String reps = 'reps';

  static double topBarElevation = 5;

  static const RoundedRectangleBorder topBarRounding =
      RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)));

  static IconButton topBarBackButton(Function() onPressed) =>
      IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 30));

  static EdgeInsets spacer({double left = 0, double right = 0, double top = 0, double bottom = 0}) =>
      EdgeInsets.fromLTRB(left, top, right, bottom);

  static BorderRadius roundedCorners = BorderRadius.circular(25);
}
