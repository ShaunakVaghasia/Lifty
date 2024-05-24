// Created by Shaunak Vaghasia

import 'package:lifty/storage/api/info/workout_info.dart';
import 'package:lifty/storage/api/storage_api.dart';
import 'package:lifty/workouts/core/workouts_core_api.dart';

class WorkoutsCore implements WorkoutsCoreApi {
  WorkoutsCore({required this.storage});

  final StorageApi storage;

  final List<WorkoutInfo> _workouts = [];
  @override
  List<WorkoutInfo> get workouts => _workouts;

  Function(List<WorkoutInfo> workouts) _onChangeWorkouts = (value) {};
  @override
  void onChangeWorkouts(Function(List<WorkoutInfo>) callback) => _onChangeWorkouts = callback;

  @override
  Future<List<WorkoutInfo>?> loadAllWorkouts() async {
    try {
      final value = await storage.workouts.loadAllWorkouts();
      if (value != null) {
        _onChangeWorkouts(value);
      }
      return value;
    } catch (e) {
      // TODO:  Error handling.
      print('Error fetching workout data: $e');
    }
    return null;
  }
}
