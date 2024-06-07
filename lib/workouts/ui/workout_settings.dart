import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lifty/app/theme/app_strings.dart';
import 'package:lifty/app/theme/color_palette.dart';
import 'package:lifty/app/theme/ui_constants.dart';
import 'package:lifty/app/utils/date_helper.dart';
import 'package:lifty/storage/api/info/workout_info.dart';
import 'package:lifty/workouts/core/workouts_core_api.dart';
import 'package:lifty/workouts/ui/create_workout.dart';

// TODO: Absolute Spaghetti code. Need to change when Mock-ups are done.
class WorkoutSettings extends StatefulWidget {
  const WorkoutSettings({
    super.key,
    required this.workoutsCore,
    this.workoutInfo,
  });

  final WorkoutsCoreApi workoutsCore;
  final WorkoutInfo? workoutInfo;
  @override
  State<WorkoutSettings> createState() => _WorkoutSettingsState();
}

class _WorkoutSettingsState extends State<WorkoutSettings> {
  late final Map<String, dynamic> exercises = widget.workoutInfo?.exercises ?? {}; // If null, start at empty list

  // Controllers
  late final TextEditingController nameController =
      TextEditingController(text: widget.workoutInfo?.name ?? UiConstants.emptyString);
  late final TextEditingController dateController =
      TextEditingController(text: DateHelper.dateFormatter(widget.workoutInfo?.date ?? Timestamp.now()));

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  _modifyExerciseMap({String? id, String? name, int? weight, int? sets, int? reps}) => showDialog(
        context: context,
        builder: (context) => ModifyExercises(
          id: id,
          exerciseName: name,
          weight: weight,
          sets: sets,
          reps: reps,
          getExercises: (exercise) =>
              id == null ? exercises.addAll(exercise) : exercises.update(id, (value) => exercise.values.first),
        ),
      );

  // _showDatePicker(DateTime currentDate) => showDialog(
  //       context: context,
  //       builder: (context) {
  //         final newDate = DatePickerDialog(
  //           firstDate: DateTime(1969, 1, 1, 11, 33),
  //           lastDate: DateTime.now(),
  //           initialDate: currentDate,
  //         );
  //         dateController.text =  DateHelper.dateFormatter(Timestamp.fromDate(newDate.))
  //         return newDate;
  //       },
  //     );

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorPalette.appBackgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: UiConstants.topBarElevation,
          shape: UiConstants.topBarRounding,
          leading: UiConstants.topBarBackButton(() => Navigator.pop(context)),
          title: const Text(AppStrings.createAWorkout),
        ),
        body: Padding(
          padding: UiConstants.spacer(left: 10, right: 10),
          child: Column(
            children: [
              Padding(padding: UiConstants.spacer(top: 15)),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  label: const Text(AppStrings.nameYourWorkout),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: UiConstants.roundedCorners,
                    borderSide: const BorderSide(color: Colors.white, width: 4),
                  ),
                ),
                controller: nameController,
                onChanged: (value) => widget.workoutInfo?.name = value,
              ),
              Padding(padding: UiConstants.spacer(bottom: 10)),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(), borderRadius: UiConstants.roundedCorners, color: Colors.white),
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (context, index) => Card(
                      shape: RoundedRectangleBorder(borderRadius: UiConstants.roundedCorners),
                      elevation: 7,
                      child: ListTile(
                        title: Text(
                          exercises.values.elementAt(index)[UiConstants.exercise],
                          style: const TextStyle(fontSize: 25, overflow: TextOverflow.ellipsis),
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              exercises.values.elementAt(index)[UiConstants.weight].toString(),
                              style: const TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis),
                            ),
                            Padding(padding: UiConstants.spacer(left: 40)),
                            Text(
                              exercises.values.elementAt(index)[UiConstants.sets].toString(),
                              style: const TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis),
                            ),
                            const Text(' X '),
                            Text(
                              exercises.values.elementAt(index)[UiConstants.reps].toString(),
                              style: const TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              _modifyExerciseMap(
                                  id: exercises.keys.elementAt(index),
                                  name: exercises.values.elementAt(index)[UiConstants.exercise],
                                  weight: exercises.values.elementAt(index)[UiConstants.weight],
                                  sets: exercises.values.elementAt(index)[UiConstants.sets],
                                  reps: exercises.values.elementAt(index)[UiConstants.reps]);
                            },
                            icon: const Icon(Icons.edit_rounded)),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => _modifyExerciseMap(),
                child: const Text(AppStrings.addExercise),
              ),
              Padding(padding: UiConstants.spacer(bottom: 10)),
              // Container(
              //   height: 100,
              //   width: 400,
              //   decoration:
              //       BoxDecoration(border: Border.all(), borderRadius: UiConstants.roundedCorners, color: Colors.white),
              //   child: GridView.builder(
              //     itemCount: 4,
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8),
              //     itemBuilder: (context, index) {
              //       return SizedBox(
              //           child: Container(
              //         decoration: BoxDecoration(
              //             border: Border.all(), borderRadius: UiConstants.roundedCorners, color: Colors.red),
              //         height: 10,
              //       ));
              //     },
              //   ),
              // ),
              TextField(
                onTap: () async {
                  final newDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                    initialDate: widget.workoutInfo?.date.toDate() ?? DateTime.now(),
                    currentDate: widget.workoutInfo?.date.toDate() ?? DateTime.now(),
                  );
                  dateController.text = DateHelper.dateFormatter(Timestamp.fromDate(newDate ?? DateTime.now()));
                },
                controller: dateController,
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  label: const Text(AppStrings.tags),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: UiConstants.roundedCorners,
                    borderSide: const BorderSide(color: Colors.white, width: 4),
                  ),
                ),
              ),
              Padding(padding: UiConstants.spacer(bottom: 10)),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  label: const Text(AppStrings.tags),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: UiConstants.roundedCorners,
                    borderSide: const BorderSide(color: Colors.white, width: 4),
                  ),
                ),
              ),
              Padding(padding: UiConstants.spacer(bottom: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final workoutInfo = widget.workoutInfo;
                      workoutInfo == null
                          ? await widget.workoutsCore.createWorkout(exercises, nameController.text, ['as'])
                          : await widget.workoutsCore.updateWorkout(workoutInfo); // '??' null-check will never execute.
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(AppStrings.saveWorkout),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(AppStrings.cancelWorkout),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
