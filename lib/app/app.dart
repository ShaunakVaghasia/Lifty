// Created by Shaunak Vaghasia

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: _authAdapter.signedInNotifier,
          builder: (context, bool signedIn, child) => signedIn ? Container() : Login(authCore: _authCore, authAdapter: _authAdapter),
        ),
      ),
    );
  }
}
