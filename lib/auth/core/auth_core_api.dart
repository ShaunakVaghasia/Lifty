// Created by Shaunak Vaghasia

abstract class AuthCoreApi {
  bool get signedIn;
  void onChangeSignedIn(Function(bool signedIn) callback);
}
