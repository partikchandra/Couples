import 'package:flutter/material.dart';
import 'package:kappuru/screens/calender.dart';
import 'package:kappuru/screens/dashboard.dart';
import 'package:kappuru/screens/logsin.dart';
import 'package:kappuru/screens/notes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: NotesScreen(),
    );
  }
}
