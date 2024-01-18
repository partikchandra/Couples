import 'package:flutter/material.dart';

class TextView extends StatelessWidget {

  final String text;

  TextView({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
        style: const TextStyle(
        fontSize: 32.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
    ));
  }
}
