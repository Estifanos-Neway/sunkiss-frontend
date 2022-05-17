import 'package:flutter/material.dart';
import 'package:Sunkiss/commons/variables.dart';
import 'package:Sunkiss/widgets/custom-app-bar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          // AppBar(
          //   title: Text("Prof"),
          // ),
          CustomAppBar(
        child: Text(
          "Profile",
          style: TextStyle(
            color: local_colors["onBackground"],
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: local_colors["background"],
        ),
        child: const Center(
            child: Text(
          "Profile",
          style: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
