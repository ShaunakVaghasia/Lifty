// Created by Shaunak Vaghasia

import 'package:flutter/material.dart';
import 'package:lifty/auth/core/auth_core_api.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.authCore});
  final AuthCoreApi authCore;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async => await authCore.signOut(),
        child: const Text('Sign Out'),
      ),
    );
  }
}
