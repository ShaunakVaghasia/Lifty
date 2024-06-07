// Created by Shaunak Vaghasia

import 'package:flutter/material.dart';
import 'package:lifty/app/theme/color_palette.dart';
import 'package:lifty/app/theme/ui_constants.dart';
import 'package:lifty/app/utils/date_helper.dart';
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
              color: ColorPalette.white,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                child: Center(
                  child: ListTile(
                    tileColor: ColorPalette.white,
                    title: Text(workouts[index].name),
                    subtitle: Text(DateHelper.isWithinCurrentWeek(workouts[index].creationDate)
                        ? DateHelper.getDayOfWeekFromTimestamp(workouts[index].creationDate, isForDate: true)
                        : DateHelper.dateFormatter(workouts[index].creationDate)),
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
                      decoration:
                          BoxDecoration(borderRadius: UiConstants.roundedCorners, color: ColorPalette.deepPurple50),
                      height: 40,
                      width: 40,
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
