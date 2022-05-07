import 'package:flutter/material.dart';

class Liked extends StatelessWidget {
  const Liked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Liked",
        style: TextStyle(
          fontSize: 80,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
