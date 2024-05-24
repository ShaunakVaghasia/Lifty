// Created by Haris Rovcanin

import 'package:lifty/storage/api/info/profile_info.dart';
import 'package:lifty/storage/api/profile_storage_api.dart';
import 'package:lifty/storage/storage_path.dart';

class ProfileStorage implements ProfileStorageApi {
  final _pathHelper = StoragePath();

  @override
  Future<List<ProfileInfo>?> loadProfile() async {}
}
