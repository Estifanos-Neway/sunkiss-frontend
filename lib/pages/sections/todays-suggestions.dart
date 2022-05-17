import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Sunkiss/commons/variables.dart';
import 'package:Sunkiss/models/content.dart';
import 'package:Sunkiss/widgets/big-content-con.dart';

class TodaysSuggestion extends StatefulWidget {
  final List<BigContentCon> todaysSuggestionConList;
  final CarouselController _carouselController = CarouselController();
  TodaysSuggestion({Key? key, required List<Content> todaysSuggestionList})
      : todaysSuggestionConList = todaysSuggestionList.map((todaysSuggestion) {
          return BigContentCon(content: todaysSuggestion);
        }).toList(),
        super(key: key);
  @override
  State<TodaysSuggestion> createState() => _TodaysSuggestionState();
}

class _TodaysSuggestionState extends State<TodaysSuggestion> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "What about you watch these today?",
          style: TextStyle(
            fontSize: 20,
            color: local_colors["onBackground"],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: CarouselSlider(
            carouselController: widget._carouselController,
            options: CarouselOptions(
              enableInfiniteScroll: widget.todaysSuggestionConList.length>1,
              height: 195.0,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: widget.todaysSuggestionConList,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.todaysSuggestionConList.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 2,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        widget._carouselController.animateToPage(index);
                      },
                      child: Icon(
                        Icons.minimize,
                        size: 30,
                        color: index == _currentIndex
                            ? local_colors["primary"]
                            : local_colors["onBackground"],
                      ),
                    ),
                  );
                },
              )),
        ),
      ],
    );
  }
}
