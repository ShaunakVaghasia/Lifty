// Created by Shaunak Vaghasia

import 'package:flutter/material.dart';
import 'package:lifty/storage/api/info/workout_info.dart';
import 'package:lifty/workouts/adapter/workouts_adapter.dart';
import 'package:lifty/workouts/core/workouts_core_api.dart';
import 'package:lifty/workouts/ui/workout_settings.dart';

class Workouts extends StatelessWidget {
  const Workouts({super.key, required this.workoutsCore, required this.workoutsAdapter});

  final WorkoutsCoreApi workoutsCore;
  final WorkoutsAdapter workoutsAdapter;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder(
          valueListenable: workoutsAdapter.workoutsNotifier,
          builder: (context, List<WorkoutInfo> workouts, child) => ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (context, index) => Card(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                child: Center(
                  child: ListTile(
                    title: Text(workouts[index].name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutSettings(
                            workoutInfo: workouts[index],
                            workoutsCore: workoutsCore,
                          ),
                        ),
                      );
                    },
                    leading: Container(
                      height: 40,
                      width: 40,
                      color: Colors.white,
                      child: const Icon(
                        Icons.fitness_center_rounded,
                      ),
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right_rounded, size: 30),
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
            child: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkoutSettings(workoutsCore: workoutsCore),
                      ),
                    )
                // await workoutsCore.createWorkout(
                //     {
                //       'bench': [3, 2]
                //     },
                //     'workout 2',
                //     ['tags', 'tags']);

                ),
          ),
        ),
      ],
    );
  }
}
