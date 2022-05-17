import 'package:flutter/material.dart';
import 'package:Sunkiss/models/content.dart';
import 'package:Sunkiss/widgets/small-content-con.dart';

class ContentList extends StatefulWidget {
  final List<Content> contentsList;
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
      physics: const NeverScrollableScrollPhysics(),
      itemCount: (widget.contentsList.length / widget.rowSize).ceil(),
      itemBuilder: (BuildContext context, rowIndex) {
        int firstContentIndex = rowIndex * widget.rowSize;
        List<Content> contentRow = [];
        for (int counter = 0; counter < widget.rowSize; counter++) {
          if (firstContentIndex+counter < widget.contentsList.length) {
            contentRow.add(widget.contentsList[firstContentIndex+counter]);
          }
        }
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contentRow.length,
              (inRowIndex) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: SmallContentCon(
                  content: contentRow[inRowIndex],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
