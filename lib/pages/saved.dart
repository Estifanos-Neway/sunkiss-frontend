import 'package:Sunkiss/models/content.dart';
import 'package:Sunkiss/states/app-state.dart';
import 'package:flutter/material.dart';
import 'package:Sunkiss/commons/variables.dart';
import 'package:Sunkiss/widgets/content-list.dart';

class Saved extends StatelessWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Content> savedContentsList = [];
    List<Content> contents =
        AppStateController.of(context).blocProvider.contentBloc.contents;
    for (Content content in contents) {
      if (content.saved) {
        savedContentsList.add(content);
      }
    }
    int rowSize = (MediaQuery.of(context).size.width / 162).floor();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Your saved contents",
          style: TextStyle(
            fontSize: 20,
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
