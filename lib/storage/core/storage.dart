import 'package:lifty/storage/api/storage_api.dart';
import 'package:lifty/storage/api/workouts_storage_api.dart';
import 'package:lifty/storage/core/workout_storage.dart';

class Storage implements StorageApi {
  Storage() : _workoutStorage = WorkoutStorage();

  final WorkoutStorage _workoutStorage;

  @override
  WorkoutsStorageApi get workouts => _workoutStorage;
}

// ignore: prefer_function_declarations_over_variables
final createStorage = () => Storage();
