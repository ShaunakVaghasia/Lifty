// Created by Shaunak Vaghasia

import 'package:flutter/material.dart';
import 'package:lifty/nav_bar/adapter/nav_bar_adapter.dart';
import 'package:lifty/nav_bar/core/nav_bar_core.dart';
import 'package:lifty/nav_bar/core/nav_bar_core_api.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  final NavBarCoreApi navBarCore = NavBarCore();
  late final NavBarAdapter navBarAdapter = NavBarAdapter(navBarCore);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: navBarAdapter.bottomBarIndexNotifier,
      builder: (context, int bottomBarIndex, child) => NavigationBar(
        selectedIndex: bottomBarIndex,
        onDestinationSelected: (index) => navBarCore.changeBottomBarIndex(index),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.fitness_center_rounded), label: 'Workouts'),
          NavigationDestination(icon: Icon(Icons.account_circle_sharp), label: 'Profile'),
        ],
      ),
    );
  }
}
