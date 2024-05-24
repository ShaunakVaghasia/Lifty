// Created by Shaunak Vaghasia

import 'package:flutter/material.dart';
import 'package:lifty/auth/adapter/auth_adapter.dart';
import 'package:lifty/auth/core/auth_core.dart';
import 'package:lifty/auth/core/auth_core_api.dart';
import 'package:lifty/auth/ui/login.dart';
import 'package:lifty/nav_bar/adapter/nav_bar_adapter.dart';
import 'package:lifty/nav_bar/core/nav_bar_core.dart';
import 'package:lifty/nav_bar/core/nav_bar_core_api.dart';
import 'package:lifty/nav_bar/ui/nav_bar.dart';
import 'package:lifty/nutrition/ui/nutrition.dart';
import 'package:lifty/profile/ui/profile.dart';
import 'package:lifty/workouts/ui/workouts.dart';

class Lifty extends StatelessWidget {
  Lifty({super.key}) {
    _authCore = AuthCore();
    _authAdapter = AuthAdapter(_authCore);
  }

  late final AuthCoreApi _authCore;
  late final AuthAdapter _authAdapter;

  final NavBarCoreApi _navBarCore = NavBarCore();
  late final NavBarAdapter _navBarAdapter = NavBarAdapter(_navBarCore);

  static const _appName = 'Lifty';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: ValueListenableBuilder(
        valueListenable: _authAdapter.signedInNotifier,
        builder: (context, bool signedIn, child) => signedIn
            ? ValueListenableBuilder(
                valueListenable: _navBarAdapter.bottomBarIndexNotifier,
                builder: (context, int bottomBarIndex, child) => Scaffold(
                    bottomNavigationBar: NavBar(
                      navBarCore: _navBarCore,
                      navBarAdapter: _navBarAdapter,
                    ),
                    body: <Widget>[
                      const Workouts(),
                      const Nutrition(),
                      Profile(authCore: _authCore),
                    ][bottomBarIndex]))
            : Scaffold(body: Login(authCore: _authCore, authAdapter: _authAdapter)),
      ),
    );
  }
}
