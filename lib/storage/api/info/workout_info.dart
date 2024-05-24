// Created by Shaunak Vaghasia

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutInfo {
  WorkoutInfo.clone(WorkoutInfo workoutInfo)
      : this(
          date: workoutInfo.date,
          exercises: workoutInfo.exercises,
          id: workoutInfo.id,
          name: workoutInfo.name,
          tags: workoutInfo.tags,
        );

  WorkoutInfo({
    this.date,
    this.exercises,
    this.id,
    this.name,
    this.tags,
  });

  Timestamp? date;
  Map? exercises;
  String? id;
  String? name;
  List? tags;

  factory WorkoutInfo.fromMap(Map<String, dynamic> json) {
    return WorkoutInfo(
      date: json['date'],
      exercises: json['exercises'],
      id: json['id'],
      name: json['name'],
      tags: json['tags'],
    );
  }

  factory WorkoutInfo.fromJson(String jsonString) =>
      WorkoutInfo.fromMap(Map<String, dynamic>.from(jsonDecode(jsonString)));

  Map<String, dynamic> workoutInfoMap() => {
        'date': date,
        'exercises': exercises,
        'id': id,
        'name': name,
        'tags': tags,
      };

  String toJson() => jsonEncode(workoutInfoMap());
}
