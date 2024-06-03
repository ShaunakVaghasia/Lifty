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

  final StorageApi storage;

  void init() async {
    try {
      await storage.workouts.loadAllWorkouts();
    } catch (e) {
      print('error loading workouts $e');
    }
  }

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

  Function(WorkoutInfo workout) _onChangeWorkout = (value) {};
  @override
  void onChangeWorkout(Function(WorkoutInfo workout) callback) => _onChangeWorkout = callback;

  @override
  Future<void> createWorkout(Map<String, dynamic> exercises, String name, List<String> tags) async {
    final id = const Uuid().v4(); // Randomly generated id.
    try {
      final workout = WorkoutInfo(
        date: Timestamp.now(),
        creationDate: Timestamp.now(),
        exercises: exercises,
        id: id,
        name: name,
        tags: tags,
      );
      await storage.workouts.saveWorkout(id, workout);
      _onChangeWorkout(workout);
    } catch (e) {
      // TODO:  Error handling.
      print('Error saving workout $e');
    }
  }

  Function(WorkoutInfo workout, String id) _onUpdateWorkout = (value, id) {};
  @override
  void onUpdateWorkout(Function(WorkoutInfo workout, String id) callback) => _onUpdateWorkout = callback;

  @override
  Future<void> updateWorkout(String id, Map<String, dynamic> exercises, String name, List<String> tags) async {
    try {
      final workout = WorkoutInfo(
        creationDate: Timestamp.now(),
        date: Timestamp.now(), // TODO.
        exercises: exercises,
        id: id,
        name: name,
        tags: tags,
      );
      await storage.workouts.saveWorkout(id, workout);
      _onUpdateWorkout(workout, id);
    } catch (e) {
      // TODO:  Error handling.
      print('Error updating workout $e');
    }
  }
}
