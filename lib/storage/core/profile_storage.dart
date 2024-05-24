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
}
