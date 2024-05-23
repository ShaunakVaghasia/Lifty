// Created by Shaunak Vaghasia

abstract class AuthCoreApi {
  /// Callback system to check if user is signed in.
  bool get signedIn;
  void onChangeSignedIn(Function(bool signedIn) callback);
}
