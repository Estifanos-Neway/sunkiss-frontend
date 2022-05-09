import 'package:flutter/material.dart';
import 'package:sunkiss/commons/variables.dart';
import 'package:sunkiss/widgets/custom-app-bar.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        child: Text(
          "About",
          style: TextStyle(
            color: local_colors["onBackground"],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: local_colors["background"],
        ),
        child: const Center(
            child: Text(
          "About",
          style: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
