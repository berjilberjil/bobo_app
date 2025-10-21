import 'package:flutter/material.dart';

class Dinning extends StatefulWidget {
  const Dinning({super.key});

  @override
  State<Dinning> createState() => _DinningState();
}

class _DinningState extends State<Dinning> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("x bitch",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
