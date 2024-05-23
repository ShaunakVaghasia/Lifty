// Created by Shaunak Vaghasia

import 'package:flutter/material.dart';
import 'package:lifty/auth/adapter/auth_adapter.dart';
import 'package:lifty/auth/core/auth_core_api.dart';

class Login extends StatelessWidget {
  const Login({super.key, required this.authCore, required this.authAdapter});

  final AuthCoreApi authCore;
  final AuthAdapter authAdapter;

  static const double _buttonHeight = 60;
  static const double _buttonWidth = 300;
  static const SizedBox _separator = SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: _buttonHeight,
            width: _buttonWidth,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          _separator,
          const SizedBox(
            height: _buttonHeight,
            width: _buttonWidth,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
          ),
          SizedBox(
            height: _buttonHeight,
            width: _buttonWidth,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
            ),
          ),
          _separator,
          SizedBox(
            height: _buttonHeight,
            width: _buttonWidth,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Register'),
            ),
          )
        ],
      ),
    );
  }
}
