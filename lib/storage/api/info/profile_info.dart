// Created by Haris Rovcanin

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileInfo {
  String id;
  String firstName;
  String lastName;
  String email;
  DateTime birthdate;
  String? gender;
  int? height;
  int? weight;
  double? bmi;
  String? unit;
  String? activityLevel;

  ProfileInfo(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.birthdate,
      this.gender,
      this.height,
      this.weight,
      this.bmi,
      this.unit,
      this.activityLevel});

  ProfileInfo.clone(ProfileInfo profileInfo)
      : this(
            id: profileInfo.id,
            firstName: profileInfo.firstName,
            lastName: profileInfo.lastName,
            email: profileInfo.email,
            birthdate: profileInfo.birthdate,
            gender: profileInfo.gender,
            height: profileInfo.height,
            weight: profileInfo.weight,
            bmi: profileInfo.bmi,
            unit: profileInfo.unit,
            activityLevel: profileInfo.activityLevel);

  factory ProfileInfo.fromMap(Map<String, dynamic> json) {
    return ProfileInfo(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        birthdate: json['birthdate'],
        gender: json['gender'],
        height: json['height'],
        weight: json['weight'],
        bmi: json['bmi'],
        unit: json['unit'],
        activityLevel: json['activityLevel']);
  }

  Map<String, dynamic> profileInfoMap() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'birthdate': birthdate,
        'gender': gender,
        'height': height,
        'weight': weight,
        'bmi': bmi,
        'unit': unit,
        'activityLevel': activityLevel
      };

  factory ProfileInfo.fromJson(String jsonString) =>
      ProfileInfo.fromMap(Map<String, dynamic>.from(jsonDecode(jsonString)));

  String toJson() => jsonEncode(profileInfoMap());
}
