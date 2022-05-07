import 'package:flutter/material.dart';
import 'package:sunkiss/commons/variables.dart';
import 'package:sunkiss/pages/sections/todays-suggestions.dart';
import 'package:sunkiss/widgets/small-movie-con.dart';
import 'package:sunkiss/data/movies-list.dart';
import 'package:sunkiss/models/movie.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final List<Movie> todaysSuggestionList = [
    Movie.fromJson(moviesList[0]),
    Movie.fromJson(moviesList[1]),
    Movie.fromJson(moviesList[2]),
    Movie.fromJson(moviesList[3]),
  ];
  @override
  Widget build(BuildContext context) {
    int rowSize = (MediaQuery.of(context).size.width/160).floor();
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
        ListView.builder(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          itemCount: (moviesList.length / rowSize).ceil(),
          itemBuilder: (BuildContext context, index) {
            index = index * rowSize;
            List<Movie> movieRow = [];
            for (int counter = 0; counter < rowSize; counter++) {
              if (index < moviesList.length) {
                movieRow.add(Movie.fromJson(moviesList[index++]));
              }
            }
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  movieRow.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: SmallMovieCon(
                      title: movieRow[index].title,
                      thumbnailUrl: movieRow[index].thumbnailUrl,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
