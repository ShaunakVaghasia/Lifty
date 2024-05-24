// Created by Shaunak Vaghasia

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lifty/storage/api/info/workout_info.dart';
import 'package:lifty/storage/api/storage_api.dart';
import 'package:lifty/workouts/core/workouts_core_api.dart';
import 'package:uuid/uuid.dart';

class WorkoutsCore implements WorkoutsCoreApi {
  WorkoutsCore({required this.storage}) {
    init();
  }

  void init() async => await loadAllWorkouts();

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

  @override
  Future<void> createWorkout(Map<String, List> exercises, String name, List<String> tags) async {
    final id = const Uuid().v4(); // Randomly generated id.
    try {
      await storage.workouts.saveWorkout(
        id,
        WorkoutInfo(
          date: Timestamp.now(),
          exercises: exercises,
          id: id,
          name: name,
          tags: tags,
        ),
      );
    } catch (e) {
      // TODO:  Error handling.
      print('Error saving workout $e');
    }
  }
}
