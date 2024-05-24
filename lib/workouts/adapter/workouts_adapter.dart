// Created by Shaunak Vaghasia

import 'package:flutter/material.dart';
import 'package:lifty/storage/api/info/workout_info.dart';
import 'package:lifty/workouts/core/workouts_core_api.dart';

class WorkoutsAdapter {
  WorkoutsAdapter(WorkoutsCoreApi workoutsCore) {
    workoutsNotifier = ValueNotifier(workoutsCore.workouts);
    workoutsCore.onChangeWorkouts((workouts) => workoutsNotifier.value = workouts);
    workoutsCore
        .onChangeWorkout((workout) => workoutsNotifier.value = List.from(workoutsNotifier.value)..insert(0, workout));
  }
  late final ValueNotifier<List<WorkoutInfo>> workoutsNotifier;
}
