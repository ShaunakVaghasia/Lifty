// Created by Haris Rovcanin

import 'package:lifty/profile/core/profile_core_api.dart';
import 'package:lifty/storage/api/storage_api.dart';

class ProfileCore implements ProfileCoreApi {
  final bool _editMode = false;
  @override
  bool get editMode => _editMode;
  @override
  void onChangeEditMode(Function(bool editMode) callback) =>
      _onChangeEditMode = callback;

  Function(bool editMode) _onChangeEditMode = (value) {};

  @override
  Future<void> updateProfile(String firstName, String lastName,
      String emailAddress, DateTime birthdate, String? gender) async {}

  Future<void> updateMeasurements(
      int height, int weight, String unit, String activityLevel) async {}
}
