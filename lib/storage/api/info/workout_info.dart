// Created by Shaunak Vaghasia

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutInfo {
  WorkoutInfo.clone(WorkoutInfo workoutInfo)
      : this(
          date: workoutInfo.date,
          creationDate: workoutInfo.creationDate,
          exercises: workoutInfo.exercises,
          id: workoutInfo.id,
          name: workoutInfo.name,
          tags: workoutInfo.tags,
        );

  WorkoutInfo({
    required this.date,
    required this.creationDate,
    required this.exercises,
    required this.id,
    required this.name,
    required this.tags,
  });

  Timestamp date;
  Timestamp creationDate;
  Map exercises;
  String id;
  String name;
  List tags;

  factory WorkoutInfo.fromMap(Map<String, dynamic> json) {
    return WorkoutInfo(
      date: json['date'],
      creationDate: json['creationDate'],
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
        'creationDate': creationDate,
        'exercises': exercises,
        'id': id,
        'name': name,
        'tags': tags,
      };

  String toJson() => jsonEncode(workoutInfoMap());
}
