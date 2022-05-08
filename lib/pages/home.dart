import 'package:flutter/material.dart';
import 'package:sunkiss/commons/variables.dart';
import 'package:sunkiss/pages/sections/todays-suggestions.dart';
import 'package:sunkiss/data/content-list.dart';
import 'package:sunkiss/models/content.dart';
import 'package:sunkiss/widgets/content-list.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final List<Content> todaysSuggestionList = [
    Content.fromJson(contentList[0]),
    Content.fromJson(contentList[1]),
    Content.fromJson(contentList[2]),
    Content.fromJson(contentList[3]),
  ];
  @override
  Widget build(BuildContext context) {
    int rowSize = (MediaQuery.of(context).size.width / 162).floor();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TodaysSuggestion(todaysSuggestionList: todaysSuggestionList),
        Text(
          "Enhance your suggestions",
          style: TextStyle(
            color: local_colors["onBackground"],
          ),
        ),
        ContentList(
          contentsList: contentList,
          rowSize: rowSize,
        ),
      ],
    );
  }
}
