// Created by Shaunak Vaghasia

import 'package:firebase_auth/firebase_auth.dart';
import 'package:lifty/auth/core/auth_core_api.dart';

class AuthCore implements AuthCoreApi {
  AuthCore() {
    isUserSignedIn();
  }

  final bool _signedIn = false;

  @override
  bool get signedIn => _signedIn;

  Function(bool signedIn) _onChangeSignedIn = (value) {};
  @override
  void onChangeSignedIn(Function(bool signedIn) callback) => _onChangeSignedIn = callback;

  void userSignedIn(bool signedIn) => _onChangeSignedIn(signedIn);

  void isUserSignedIn() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        userSignedIn(false);
      } else {
        print('User is signed in!');
        userSignedIn(true);
      }
    });
  }
}
