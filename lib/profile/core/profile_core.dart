// Created by Haris Rovcanin

import 'package:cloud_firestore/cloud_firestore.dart';
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
  Function(bool editMode) _onChangeEditMode = (value) {};
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

  @override
  Future<ProfileInfo?> loadProfile() async {
    try {
      final value = await storage.profile.loadProfile();
      if (value != null) {
        _onChangeProfile(value);
        // print("Getting User Profile"); // Debug.
        // print("First Name: ${value.firstName}");  // Debug.
        // print("First Name: ${value.firstName}");  // Debug.
        // print("Email: ${value.email}"); // Debug.
      }
      return value;
    } catch (e) {
      print('Error loading profile: $e');
      return null;
    }
  }

  @override
  Future<void> updateProfile(String firstName, String lastName,
      String emailAddress, DateTime birthdate, String? gender) async {
    final userId = storage.profile.getUserId();
    try {
      if (userId != null) {
        final profile = ProfileInfo(
            id: userId,
            firstName: firstName,
            lastName: lastName,
            email: emailAddress,
            birthdate: Timestamp.fromDate(birthdate),
            gender: gender);
        await storage.profile.saveProfile(profile);
        _onChangeProfile(profile);
      } else {
        throw new Exception('NoUserIdFound');
      }
    } catch (e) {
      print('Error occurred while saving profile: $e');
    }
  }

  @override
  Future<void> updateHeight(int height, String unit) async {
    try {
      final profile = await storage.profile.loadProfile();
      if (profile != null) {
        profile.height = height;
        profile.heightUnit = unit;
        await storage.profile.saveProfile(profile);
        _onChangeProfile(profile);
      } else {
        throw new Exception('NoProfileFound');
      }
    } catch (e) {
      print('Error occurred while updating user profile: $e');
    }
  }

  @override
  Future<void> updateWeight(double weight, String unit) async {
    try {
      final profile = await storage.profile.loadProfile();
      if (profile != null) {
        profile.weight = weight;
        profile.weightUnit = unit;
        await storage.profile.saveProfile(profile);
        _onChangeProfile(profile);
      } else {
        throw new Exception('NoProfileFound');
      }
    } catch (e) {
      print('Error occurred while updating user profile: $e');
    }
  }

  @override
  Future<void> updateActivityLevel(String activityLevel) async {
    try {
      final profile = await storage.profile.loadProfile();
      if (profile != null) {
        profile.activityLevel = activityLevel;
        await storage.profile.saveProfile(profile);
        _onChangeProfile(profile);
      } else {
        throw new Exception('NoProfileFound');
      }
    } catch (e) {
      print('Error occurred while updating user profile: $e');
    }
  }
}
