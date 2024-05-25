import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifty/workouts/core/workouts_core_api.dart';

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
  final Map<String, List>? exercisesList;
  final String name;

  @override
  State<WorkoutSettings> createState() => _WorkoutSettingsState();
}

class _WorkoutSettingsState extends State<WorkoutSettings> {
  late final Map<String, List> exercises = widget.exercisesList ?? {}; // If null, start at empty list

  // Controllers
  final TextEditingController nameController = TextEditingController();

  final TextEditingController exerciseNameControler = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController setsController = TextEditingController();
  final TextEditingController repsController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    weightController.dispose();
    setsController.dispose();
    repsController.dispose();
    super.dispose();
  }

  _addExercise() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            height: 200,
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    label: const Text('Exercise Name'),
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
                          label: const Text('Weight'),
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
                          label: const Text('Sets'),
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
                          label: const Text('Reps'),
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
                        exercises.addAll({
                          exerciseNameControler.text: [
                            int.parse(weightController.text),
                            int.parse(setsController.text),
                            int.parse(repsController.text),
                          ]
                        });
                        Navigator.pop(context);
                        exerciseNameControler.clear();
                        weightController.clear();
                        setsController.clear();
                        repsController.clear();
                      },
                      child: const Text('Save'),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        exerciseNameControler.clear();
                        weightController.clear();
                        setsController.clear();
                        repsController.clear();
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 5,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
        leading: const Icon(Icons.arrow_back_ios_new_rounded, size: 30),
        title: const Text('Create a Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 15)),
            TextField(
              decoration: InputDecoration(
                filled: true,
                label: const Text('Name your workout'),
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
                            exercises.values.elementAt(index)[0].toString(),
                            style: const TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 40)),
                          Text(
                            exercises.values.elementAt(index)[1].toString(),
                            style: const TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis),
                          ),
                          const Text(' X '),
                          Text(
                            exercises.values.elementAt(index)[2].toString(),
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
              child: const Text('Add Exercise'),
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                label: const Text('Tags'),
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
                  child: const Text('Save Workout'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel Workout'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
