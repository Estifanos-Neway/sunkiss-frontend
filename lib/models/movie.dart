import 'package:sunkiss/commons/variables.dart';

class Movie {
  String title;
  String thumbnailUrl;
  String summary;
  Movie({
    required this.title,
    this.thumbnailUrl = local_defaultMovieThumbnail,
    required this.summary,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        thumbnailUrl = json["thumbnailUrl"] ?? local_defaultMovieThumbnail,
        summary = json["summary"];
  Map<String, dynamic> toJson() => {
        "title": title,
        "thumbnailUrl": thumbnailUrl,
        "summary": summary,
      };
}
