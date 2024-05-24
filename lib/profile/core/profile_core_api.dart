// Created by Haris Rovcanin

abstract class ProfileCoreApi {
  // Callback to check if profile fields are editable
  bool get editMode;
  void onChangeEditMode(Function(bool editMode) callback);

  // Submit profile updates
  Future<void> updateProfile(String firstName, String lastName,
      String emailAddress, DateTime birthdate, String? gender);
  Future<void> updateMeasurements(
      int height, int weight, String unit, String activityLevel);
}
