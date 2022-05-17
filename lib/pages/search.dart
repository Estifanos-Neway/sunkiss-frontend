import 'package:Sunkiss/commons/variables.dart';
import 'package:Sunkiss/data/content-list.dart';
import 'package:Sunkiss/models/content.dart';
import 'package:Sunkiss/states/app-state.dart';
import 'package:Sunkiss/widgets/content-list.dart';
import 'package:Sunkiss/widgets/custom-app-bar.dart';
import 'package:Sunkiss/widgets/custom-scrollable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Content> savedContentsList = [];
    List<Content> contents =
        AppStateController.of(context).blocProvider.contentBloc.contents;
    for (Content content in contents) {
      if (content.rate == 3 || content.saved) {
        savedContentsList.add(content);
      }
    }
    int rowSize = (MediaQuery.of(context).size.width / 162).floor();
    return CustomScrollable(
      child: Column(
        children: [
          CustomAppBar(
            where: "Search",
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: local_colors["surface"],
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: local_colors["onBackground"]!.withOpacity(0.1),
                        blurRadius: 3,
                        offset: const Offset(
                          0,
                          3,
                        ),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            color: local_colors["onSurface"],
                          ),
                          cursorColor: local_colors["onSurface"],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                            hintStyle: TextStyle(
                              color:
                                  local_colors["onSurface"]?.withOpacity(0.5),
                            ),
                            isCollapsed: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.search,
                        color: local_colors["onSurface"],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ContentList(
                  contentsList: savedContentsList,
                  rowSize: rowSize,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
