import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF131315),
      body: Center(
        child: Text(
          "New Page",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),  
    );
  }
}