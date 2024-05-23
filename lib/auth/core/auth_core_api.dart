// Created by Shaunak Vaghasia

abstract class AuthCoreApi {
  /// Callback system to check if user is signed in.
  bool get signedIn;
  void onChangeSignedIn(Function(bool signedIn) callback);

  /// User Authentication and Creation
  Future<void> createUserWithEmailAndPassword(String emailAddress, String password);
  Future<void> signInWithEmailAndPassword(String emailAddress, String password);
  Future<void> signOut();
}
