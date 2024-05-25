// Created by Haris Rovcanin

import 'package:lifty/storage/api/info/profile_info.dart';
import 'package:lifty/storage/api/profile_storage_api.dart';
import 'package:lifty/storage/storage_path.dart';

class ProfileStorage implements ProfileStorageApi {
  final _pathHelper = StoragePath();

  @override
  Future<ProfileInfo?> loadProfile() async {
    try {
      final snapshot = await _pathHelper.userPath().get();
      final data = snapshot.data();
      if (data is Map<String, dynamic>) {
        return ProfileInfo.fromMap(data);
      }
      return null;
    } catch (e) {
      print('Error retrieving user profile: $e');
      return null;
    }
  }

  @override
  Future<void> saveProfile(ProfileInfo profile) async {
    try {
      await _pathHelper.userPath().set(profile.profileInfoMap());
    } catch (e) {
      print('Error occurred while updating profile: $e');
    }
  }

  @override
  String? getUserId() {
    try {
      return _pathHelper.getCurrentUserId();
    } catch (e) {
      print('Error occurred while fetching user Id: $e');
    }
  }
}
