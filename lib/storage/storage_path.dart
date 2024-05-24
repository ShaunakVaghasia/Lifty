// Created by Shaunak Vaghasia

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StoragePath {
  static const usersCollection = 'users';
  static const workoutsCollection = 'workouts';
  static const nutritionCollection = 'nutrition';

  final base = FirebaseFirestore.instance;

  String? getCurrentUser() => FirebaseAuth.instance.currentUser?.uid;

  // Collections
  CollectionReference userPath() => base.collection(usersCollection);
  CollectionReference workoutPath() =>
      base.collection(usersCollection).doc(getCurrentUser()).collection(workoutsCollection);
  CollectionReference nutritionPath() =>
      base.collection(usersCollection).doc(getCurrentUser()).collection(nutritionCollection);
}
