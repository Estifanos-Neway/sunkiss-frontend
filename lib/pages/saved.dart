import 'package:flutter/material.dart';
import 'package:sunkiss/commons/variables.dart';
import 'package:sunkiss/data/content-list.dart';
import 'package:sunkiss/widgets/content-list.dart';

class Saved extends StatelessWidget {
  final List<Map<String, dynamic>> savedContentsList = [];
  Saved({Key? key}) : super(key: key) {
    for (Map<String, dynamic> content in contentList) {
      if (content["saved"] ?? false) {
        savedContentsList.add(content);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int rowSize = (MediaQuery.of(context).size.width / 162).floor();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Your saved contents",
          style: TextStyle(
            color: local_colors["onBackground"],
          ),
        ),
        ContentList(
          contentsList: savedContentsList,
          rowSize: rowSize,
        ),
      ],
    );
  }
}
