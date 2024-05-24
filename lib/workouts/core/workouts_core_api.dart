// Created by Shaunak Vaghasia

import 'package:lifty/storage/api/info/workout_info.dart';

abstract class WorkoutsCoreApi {
  ///
  List<WorkoutInfo> get workouts;
  void onChangeWorkouts(Function(List<WorkoutInfo>) callback);
  Future<void> loadAllWorkouts();

  ///
  Future<void> createWorkout(Map<String, List> exercises, String name, List<String> tags);
}
