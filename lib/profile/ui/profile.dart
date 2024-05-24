// Created by Shaunak Vaghasia

import 'package:flutter/material.dart';
import 'package:lifty/auth/core/auth_core_api.dart';
import 'package:lifty/profile/core/profile_core_api.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.authCore, required this.profileCore});
  final AuthCoreApi authCore;
  final ProfileCoreApi profileCore;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async => await profileCore.loadProfile(),
            child: const Text('Get Profile'),
          ),
          ElevatedButton(
            onPressed: () async => await authCore.signOut(),
            child: const Text('Sign Out'),
          )
        ],
      ),
    );
  }
}
