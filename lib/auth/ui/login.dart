// Created by Shaunak Vaghasia

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  static const double _buttonHeight = 60;
  static const double _buttonWidth = 300;
  static const SizedBox _separator = SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
