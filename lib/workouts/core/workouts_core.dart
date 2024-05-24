// Created by Shaunak Vaghasia

import 'package:lifty/storage/api/storage_api.dart';
import 'package:lifty/workouts/core/workouts_core_api.dart';

class WorkoutsCore implements WorkoutsCoreApi {
  WorkoutsCore({required this.storage});

  final StorageApi storage;

  @override
  Future<void> loadAllWorkouts() async => await storage.workouts.loadAllWorkouts();
}
