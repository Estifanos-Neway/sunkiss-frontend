import 'package:Sunkiss/states/app-state.dart';
import 'package:flutter/material.dart';
import 'package:Sunkiss/commons/variables.dart';
import 'package:Sunkiss/pages/sections/todays-suggestions.dart';
import 'package:Sunkiss/models/content.dart';
import 'package:Sunkiss/widgets/content-list.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Content> contents =
        AppStateController.of(context).blocProvider.contentBloc.contents;
    List<Content> todaysSuggestionList = [
      contents[0],
      contents[1],
      contents[2],
    ];
    int rowSize = (MediaQuery.of(context).size.width / 192).floor();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TodaysSuggestion(todaysSuggestionList: todaysSuggestionList),
        Text(
          "Enhance your suggestions",
          style: TextStyle(
            fontSize: 20,
            color: local_colors["onBackground"],
          ),
        ),
        ContentList(
          contentsList:
              AppStateController.of(context).blocProvider.contentBloc.contents,
          rowSize: rowSize,
        ),
      ],
    );
  }
}
