import 'package:Sunkiss/states/app-state.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Search",
        style: TextStyle(
          fontSize: 80,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
