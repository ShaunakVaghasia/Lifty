// Created by Shaunak Vaghasia

import 'package:flutter/material.dart';
import 'package:lifty/Home/ui/home.dart';
import 'package:lifty/auth/adapter/auth_adapter.dart';
import 'package:lifty/auth/core/auth_core.dart';
import 'package:lifty/auth/core/auth_core_api.dart';
import 'package:lifty/auth/ui/login.dart';

class Lifty extends StatelessWidget {
  Lifty({super.key}) {
    _authCore = AuthCore();
    _authAdapter = AuthAdapter(_authCore);
  }

  late final AuthCoreApi _authCore;
  late final AuthAdapter _authAdapter;

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
      home: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: _authAdapter.signedInNotifier,
          builder: (context, bool signedIn, child) =>
              signedIn ? Home(authCore: _authCore) : Login(authCore: _authCore, authAdapter: _authAdapter),
        ),
      ),
    );
  }
}
