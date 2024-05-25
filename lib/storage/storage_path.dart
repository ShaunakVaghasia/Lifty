// Created by Shaunak Vaghasia

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StoragePath {
  static const usersCollection = 'users';
  static const workoutsCollection = 'workouts';
  static const nutritionCollection = 'nutrition';

  final base = FirebaseFirestore.instance;

  String? getCurrentUser() => FirebaseAuth.instance.currentUser?.uid;

  /// Main user path
  DocumentReference userPath() => base.collection(usersCollection).doc(getCurrentUser());

  // Collections

  CollectionReference workoutPath() => userPath().collection(workoutsCollection);
  CollectionReference nutritionPath() => userPath().collection(nutritionCollection);

  /// Documents
  DocumentReference documentWorkoutPath(String id) => workoutPath().doc(id);
}