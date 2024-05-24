import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lifty/app/app.dart';
import 'package:lifty/firebase_options.dart';
import 'package:lifty/storage/api/storage_api.dart';
import 'package:lifty/storage/core/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  StorageApi storage = createStorage();

  runApp(Lifty(storage: storage));
}
