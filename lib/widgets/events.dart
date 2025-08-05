import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _DinningState();
}

class _DinningState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [Text("Events bitch",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        )]);
  }
}
