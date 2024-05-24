import 'package:lifty/storage/api/profile_storage_api.dart';
import 'package:lifty/storage/api/storage_api.dart';
import 'package:lifty/storage/api/workouts_storage_api.dart';
import 'package:lifty/storage/core/profile_storage.dart';
import 'package:lifty/storage/core/workout_storage.dart';

class Storage implements StorageApi {
  Storage()
      : _profileStorage = ProfileStorage(),
        _workoutStorage = WorkoutStorage();

  final ProfileStorage _profileStorage;
  final WorkoutStorage _workoutStorage;

  @override
  WorkoutsStorageApi get workouts => _workoutStorage;

  @override
  ProfileStorageApi get profile => _profileStorage;
}

// ignore: prefer_function_declarations_over_variables
final createStorage = () => Storage();
