import 'package:lifty/storage/api/info/workout_info.dart';
import 'package:lifty/storage/api/workouts_storage_api.dart';
import 'package:lifty/storage/storage_path.dart';

class WorkoutStorage implements WorkoutsStorageApi {
  final _pathHelper = StoragePath();

  @override
  Future<List<WorkoutInfo>?> loadAllWorkouts() async {
    final List<WorkoutInfo> allWorkouts = [];
    try {
      final snapshot = await _pathHelper.workoutPath().get();
      for (final doc in snapshot.docs) {
        final data = doc.data();
        if (data is Map<String, dynamic>) {
          final workoutInfo = WorkoutInfo.fromMap(data);
          allWorkouts.add(workoutInfo);
        }
      }
      return allWorkouts;
    } catch (e) {
      print('Error fetching all workouts: $e');
      return null;
    }
  }
}
