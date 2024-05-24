import 'package:flutter/material.dart';
import 'package:lifty/storage/api/workouts_storage_api.dart';

@immutable
abstract class StorageApi {
  WorkoutsStorageApi get workouts;
}
