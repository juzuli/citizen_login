import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/app.dart';

void main() async{
  await Firebase.initializeApp();
  runApp(const MyApp());
}
