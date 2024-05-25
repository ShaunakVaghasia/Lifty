import 'package:flutter/material.dart';

class UiConstants {
  static const int weight = 0;
  static const int sets = 1;
  static const int reps = 2;

  static IconButton topBarBackButton(Function() onPressed) =>
      IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 30));
}
