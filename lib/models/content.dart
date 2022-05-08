import 'package:sunkiss/commons/variables.dart';

class Content {
  String title;
  String thumbnailUrl;
  String summary;
  bool saved;
  int rate;
  Content(
      {required this.title,
      this.thumbnailUrl = local_defaultContentThumbnail,
      required this.summary,
      this.saved = false,
      this.rate = 0});

  Content.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        thumbnailUrl = json["thumbnailUrl"] ?? local_defaultContentThumbnail,
        summary = json["summary"],
        saved = json["saved"] ?? false,
        rate = json["rate"] ?? 0;
  Map<String, dynamic> toJson() => {
        "title": title,
        "thumbnailUrl": thumbnailUrl,
        "summary": summary,
        "saved": saved,
        "rate": rate
      };
}
