import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lifty/app/app.dart';
import 'package:lifty/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(Lifty());
}
