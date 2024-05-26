// Created by Shaunak Vaghasia

import 'package:lifty/storage/api/info/workout_info.dart';

abstract class WorkoutsCoreApi {
  ///
  List<WorkoutInfo> get workouts;
  void onChangeWorkouts(Function(List<WorkoutInfo>) callback);
  Future<void> loadAllWorkouts();

  ///
  void onChangeWorkout(Function(WorkoutInfo workout) callback);
  Future<void> createWorkout(Map<String, dynamic> exercises, String name, List<String> tags);
  Future<void> updateWorkout(String id, Map<String, dynamic> exercises, String name, List<String> tags);
}
