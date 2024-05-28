import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifty/app/theme/app_strings.dart';

class CreateWorkout extends StatelessWidget {
  CreateWorkout({super.key, required this.getExercises});

  final Function(Map<String, dynamic> exercises) getExercises;

  final TextEditingController exerciseNameControler = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController setsController = TextEditingController();
  final TextEditingController repsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 200,
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            TextField(
              decoration: InputDecoration(
                filled: true,
                label: const Text(AppStrings.exerciseName),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: Colors.white, width: 4),
                ),
              ),
              controller: exerciseNameControler,
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      filled: true,
                      label: const Text(AppStrings.weight),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.white, width: 4),
                      ),
                    ),
                    controller: weightController,
                  ),
                ),
                const Padding(padding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
                SizedBox(
                  width: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      filled: true,
                      label: const Text(AppStrings.sets),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.white, width: 4),
                      ),
                    ),
                    controller: setsController,
                  ),
                ),
                const Padding(padding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
                SizedBox(
                  width: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      filled: true,
                      label: const Text(AppStrings.reps),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.white, width: 4),
                      ),
                    ),
                    controller: repsController,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    getExercises({
                      exerciseNameControler.text: [
                        int.parse(weightController.text),
                        int.parse(setsController.text),
                        int.parse(repsController.text),
                      ]
                    });
                    Navigator.pop(context);
                    // exerciseNameControler.clear();
                    // weightController.clear();
                    // setsController.clear();
                    // repsController.clear();
                  },
                  child: const Text('Save'),
                ),
                const Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // exerciseNameControler.clear();
                    // weightController.clear();
                    // setsController.clear();
                    // repsController.clear();
                  },
                  child: const Text('Cancel'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
