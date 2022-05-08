import 'package:flutter/material.dart';
import 'package:sunkiss/models/content.dart';
import 'package:sunkiss/widgets/small-content-con.dart';

class ContentList extends StatefulWidget {
  final List<Map<String, dynamic>> contentsList;
  final int rowSize;
  const ContentList(
      {Key? key, required this.contentsList, required this.rowSize})
      : super(key: key);

  @override
  State<ContentList> createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: (widget.contentsList.length / widget.rowSize).ceil(),
      itemBuilder: (BuildContext context, index) {
        index = index * widget.rowSize;
        List<Content> contentRow = [];
        for (int counter = 0; counter < widget.rowSize; counter++) {
          if (index < widget.contentsList.length) {
            contentRow.add(Content.fromJson(widget.contentsList[index++]));
          }
        }
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contentRow.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: SmallContentCon(
                  content: contentRow[index],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
