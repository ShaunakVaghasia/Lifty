// Created by Shaunak Vaghasia

import 'package:lifty/storage/api/storage_api.dart';
import 'package:lifty/storage/core/storage.dart';
import 'package:lifty/workouts/core/workouts_core_api.dart';

class WorkoutsCore implements WorkoutsCoreApi {
  StorageApi storage = createStorage();
}
