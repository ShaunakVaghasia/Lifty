// Created by Shaunak Vaghasia

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 40,
          width: 200,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Login'),
          ),
        ),
        SizedBox(
          height: 40,
          width: 200,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Register'),
          ),
        )
      ],
    );
  }
}
