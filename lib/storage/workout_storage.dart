import 'package:lifty/storage/api/info/workout_info.dart';
import 'package:lifty/storage/api/workouts_storage_api.dart';

class WorkoutStorage implements WorkoutsStorageApi {
  Future<List<WorkoutInfo>> loadAllWorkoutInfo() async {
    return [];
  }
}
