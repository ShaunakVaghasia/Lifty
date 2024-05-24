import 'package:flutter/material.dart';
import 'package:lifty/storage/api/profile_storage_api.dart';
import 'package:lifty/storage/api/workouts_storage_api.dart';

@immutable
abstract class StorageApi {
  ProfileStorageApi get profile;
  WorkoutsStorageApi get workouts;
}
