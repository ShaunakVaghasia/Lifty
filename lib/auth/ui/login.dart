// Created by Shaunak Vaghasia

import 'package:flutter/material.dart';
import 'package:lifty/auth/adapter/auth_adapter.dart';
import 'package:lifty/auth/core/auth_core_api.dart';

class Login extends StatelessWidget {
  Login({super.key, required this.authCore, required this.authAdapter});

  final AuthCoreApi authCore;
  final AuthAdapter authAdapter;

  static const double _buttonHeight = 60;
  static const double _buttonWidth = 300;
  static const SizedBox _separator = SizedBox(height: 20);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: _buttonHeight,
            width: _buttonWidth,
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          _separator,
          SizedBox(
            height: _buttonHeight,
            width: _buttonWidth,
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
          ),
          SizedBox(
            height: _buttonHeight,
            width: _buttonWidth,
            child: ElevatedButton(
              onPressed: () async => await authCore.signInWithEmailAndPassword(
                  emailController.text.trim(), passwordController.text.trim()),
              child: const Text('Login'),
            ),
          ),
          _separator,
          SizedBox(
            height: _buttonHeight,
            width: _buttonWidth,
            child: ElevatedButton(
              onPressed: () async => await authCore.createUserWithEmailAndPassword(
                  emailController.text.trim(), passwordController.text.trim()),
              child: const Text('Register'),
            ),
          )
        ],
      ),
    );
  }
}
