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
  @override
  void onChangeSignedIn(Function(bool signedIn) callback) => _onChangeSignedIn = callback;

  Function(bool signedIn) _onChangeSignedIn = (value) {};

  void isUserSignedIn() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        // print('User is currently signed out!'); // Debug.
        _onChangeSignedIn(false);
      } else {
        // print('User is signed in!'); // Debug.
        _onChangeSignedIn(true);
      }
    });
  }

  @override
  Future<void> createUserWithEmailAndPassword(String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.'); // Debug.
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.'); // Debug.
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for that email.'); // Debug.
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided for that user.'); // Debug.
      }
    }
  }

  @override
  Future<void> signOut() async => await FirebaseAuth.instance.signOut();
}
