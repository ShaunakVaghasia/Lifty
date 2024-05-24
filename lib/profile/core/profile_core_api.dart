// Created by Haris Rovcanin

import 'package:lifty/storage/api/info/profile_info.dart';

abstract class ProfileCoreApi {
  // Callback to check if profile fields are editable
  bool get editMode;
  void onChangeEditMode(Function(bool editMode) callback);

  // Get user profile
  ProfileInfo? get profile;
  void onChangeProfile(Function(ProfileInfo) callback);
  Future<void> loadProfile();

  // Submit profile updates
  Future<void> updateProfile(String firstName, String lastName,
      String emailAddress, DateTime birthdate, String? gender);
  Future<void> updateMeasurements(
      int height, int weight, String unit, String activityLevel);
}
