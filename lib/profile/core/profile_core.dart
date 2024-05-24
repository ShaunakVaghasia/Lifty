// Created by Haris Rovcanin

import 'package:lifty/profile/core/profile_core_api.dart';
import 'package:lifty/storage/api/info/profile_info.dart';
import 'package:lifty/storage/api/storage_api.dart';

class ProfileCore implements ProfileCoreApi {
  ProfileCore({required this.storage}) {
    init();
  }

  void init() async => await loadProfile();

  final StorageApi storage;
  final bool _editMode = false;

  @override
  bool get editMode => _editMode;
  @override
  void onChangeEditMode(Function(bool editMode) callback) =>
      _onChangeEditMode = callback;

  final ProfileInfo? _profile = null;
  @override
  ProfileInfo? get profile => _profile;

  Function(ProfileInfo profile) _onChangeProfile = (value) {};
  @override
  void onChangeProfile(Function(ProfileInfo) callback) =>
      _onChangeProfile = callback;

  Function(bool editMode) _onChangeEditMode = (value) {};

  @override
  Future<ProfileInfo?> loadProfile() async {
    try {
      final value = await storage.profile.loadProfile();
      if (value != null) {
        _onChangeProfile(value);
        print("Getting User Profile");
        print("First Name: ${value.firstName}");
        print("Last Name: ${value.lastName}");
        print("Email: ${value.email}");
      }
      return value;
    } catch (e) {
      print('Error loading profile: $e');
    }
  }

  @override
  Future<void> updateProfile(String firstName, String lastName,
      String emailAddress, DateTime birthdate, String? gender) async {}

  @override
  Future<void> updateMeasurements(
      int height, int weight, String unit, String activityLevel) async {}
}
