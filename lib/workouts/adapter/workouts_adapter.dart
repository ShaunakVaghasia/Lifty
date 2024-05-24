// Created by Shaunak Vaghasia

import 'package:flutter/material.dart';
import 'package:lifty/storage/api/info/workout_info.dart';
import 'package:lifty/workouts/core/workouts_core_api.dart';

class WorkoutsAdapter {
  WorkoutsAdapter(WorkoutsCoreApi workoutsCore) {
    workoutsNotifier = ValueNotifier(workoutsCore.workouts);
    workoutsCore.onChangeWorkouts((workouts) => workoutsNotifier.value = workouts);
  }
  late final ValueNotifier<List<WorkoutInfo>> workoutsNotifier;
}
