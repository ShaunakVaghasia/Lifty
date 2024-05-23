// Created by Shaunak Vaghasia

import 'package:flutter/material.dart';
import 'package:lifty/auth/core/auth_core_api.dart';

@immutable
class AuthAdapter {
  AuthAdapter(AuthCoreApi authCore) {
    signedInNotifier = ValueNotifier(authCore.signedIn);
    authCore.onChangeSignedIn((signedIn) => signedInNotifier.value = signedIn);
  }

  late final ValueNotifier<bool> signedInNotifier;
}
