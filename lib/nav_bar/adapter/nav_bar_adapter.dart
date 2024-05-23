// Created by Shaunak Vaghasia

import 'package:flutter/material.dart';
import 'package:lifty/nav_bar/core/nav_bar_core_api.dart';

class NavBarAdapter {
  NavBarAdapter(NavBarCoreApi navBarCore) {
    bottomBarIndexNotifier = ValueNotifier(navBarCore.bottomBarIndex);
    navBarCore.onChangeBottomBarIndex((bottomBarIndex) => bottomBarIndexNotifier.value = bottomBarIndex);
  }
  late final ValueNotifier<int> bottomBarIndexNotifier;
}
