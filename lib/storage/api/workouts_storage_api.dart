import 'package:lifty/storage/api/info/workout_info.dart';

abstract class WorkoutsStorageApi {
  /// Returns a list of all workouts for the specific signed-in user.
  Future<List<WorkoutInfo>?> loadAllWorkouts();

  /// Create and save a workout
  Future<void> saveWorkout(String id, WorkoutInfo workout);
}
