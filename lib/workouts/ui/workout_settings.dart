import 'package:flutter/material.dart';
import 'package:lifty/app/theme/app_strings.dart';
import 'package:lifty/app/theme/color_palette.dart';
import 'package:lifty/app/theme/ui_constants.dart';
import 'package:lifty/workouts/core/workouts_core_api.dart';
import 'package:lifty/workouts/ui/create_workout.dart';

// TODO: Absolute Spaghetti code. Need to change when Mock-ups are done.
class WorkoutSettings extends StatefulWidget {
  const WorkoutSettings({
    super.key,
    required this.workoutsCore,
    required this.updating,
    this.name = '',
    this.exercisesList,
  });

  final WorkoutsCoreApi workoutsCore;

  final bool updating;
  final Map<String, dynamic>? exercisesList;
  final String name;

  @override
  State<WorkoutSettings> createState() => _WorkoutSettingsState();
}

class _WorkoutSettingsState extends State<WorkoutSettings> {
  late final Map<String, dynamic> exercises = widget.exercisesList ?? {}; // If null, start at empty list

  // Controllers
  late final TextEditingController nameController = TextEditingController(text: widget.name);

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  _addExercise() => showDialog(
        context: context,
        builder: (context) => CreateWorkout(
          getExercises: (exercise) => exercises.addAll(exercise),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorPalette.appBackgroundColor,
        appBar: AppBar(
          elevation: 5,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
          leading: const Icon(Icons.arrow_back_ios_new_rounded, size: 30),
          title: const Text(AppStrings.createAWorkout),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 15)),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  label: const Text(AppStrings.nameYourWorkout),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(color: Colors.white, width: 4),
                  ),
                ),
                controller: nameController,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              SingleChildScrollView(
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(20), color: Colors.white),
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (context, index) => Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      elevation: 7,
                      child: ListTile(
                        title: Text(
                          exercises.keys.elementAt(index),
                          style: const TextStyle(fontSize: 25, overflow: TextOverflow.ellipsis),
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              exercises.values.elementAt(index)[UiConstants.weight].toString(),
                              style: const TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 40)),
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
                        trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.edit_rounded)),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _addExercise();
                },
                child: const Text(AppStrings.addExercise),
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  label: const Text(AppStrings.tags),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(color: Colors.white, width: 4),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await widget.workoutsCore.createWorkout(exercises, nameController.text, ['as']);
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
