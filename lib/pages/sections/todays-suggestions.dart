import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sunkiss/commons/variables.dart';
import 'package:sunkiss/models/movie.dart';
import 'package:sunkiss/widgets/big-movie-con.dart';

class TodaysSuggestion extends StatefulWidget {
  final List<BigMovieCon> todaysSuggestionConList;
  final CarouselController _carouselController = CarouselController();
  TodaysSuggestion({Key? key, required List<Movie> todaysSuggestionList})
      : todaysSuggestionConList = todaysSuggestionList.map((todaysSuggestion) {
          return BigMovieCon(movie: todaysSuggestion);
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
          "Today's Suggestions",
          style: TextStyle(
            color: local_colors["onBackground"],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: CarouselSlider(
            carouselController: widget._carouselController,
            options: CarouselOptions(
              height: 160.0,
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
