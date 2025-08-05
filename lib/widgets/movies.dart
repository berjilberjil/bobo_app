import 'package:flutter/material.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _DinningState();
}

class _DinningState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Movies bitch",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
