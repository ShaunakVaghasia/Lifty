import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WorkoutSettings extends StatefulWidget {
  const WorkoutSettings({super.key});

  @override
  State<WorkoutSettings> createState() => _WorkoutSettingsState();
}

class _WorkoutSettingsState extends State<WorkoutSettings> {
  final Map<String, List> exercises = {};

  // Controllers
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();

    super.dispose();
  }

  _addExercise() {
    final TextEditingController exerciseNameControler = TextEditingController();
    final TextEditingController setsController = TextEditingController();
    final TextEditingController repsController = TextEditingController();
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
                      width: 150,
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
                    const Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
                    SizedBox(
                      width: 150,
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
                        exercises.addAll({exerciseNameControler.text: []});
                      },
                      child: const Text('Save'),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
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
        leading: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 30,
        ),
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
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.55,
                color: Colors.red,
                child: Stack(
                  children: [
                    ListView.builder(
                      itemCount: exercises.length,
                      itemBuilder: (context, index) {
                        return const Text('1');
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          _addExercise();
                        },
                        child: const Text('Add Exercise'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
