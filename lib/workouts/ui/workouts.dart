// Created by Shaunak Vaghasia

import 'package:flutter/material.dart';

class Workouts extends StatelessWidget {
  const Workouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: <Widget>[
            Container(
              height: 50,
              width: 30,
              color: Colors.red,
            ),
            Container(
              height: 50,
              width: 30,
              color: Colors.blue,
            ),
            Container(
              height: 50,
              width: 30,
              color: Colors.teal,
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
              child: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {},
              )),
        ),
      ],
    );
  }
}
