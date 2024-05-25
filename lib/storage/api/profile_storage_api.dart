// Created by Haris Rovcanin

import 'package:lifty/storage/api/info/profile_info.dart';

abstract class ProfileStorageApi {
  // Return the users profile
  Future<ProfileInfo?> loadProfile();

  // Create or update user profile
  Future<void> saveProfile(ProfileInfo profile);

  // Get User Id
  String? getUserId();
}
