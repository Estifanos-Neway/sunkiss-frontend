import 'package:Sunkiss/commons/variables.dart';

class Content {
  int id;
  String title;
  String thumbnailUrl;
  String summary;
  bool saved;
  int rate;
  Content({
    required this.id,
    required this.title,
    this.thumbnailUrl = local_defaultContentThumbnail,
    required this.summary,
    this.saved = false,
    this.rate = 0,
  });

  Content.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        thumbnailUrl = json["thumbnailUrl"] ?? local_defaultContentThumbnail,
        summary = json["summary"],
        saved = json["saved"] ?? false,
        rate = json["rate"] ?? 0;
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "thumbnailUrl": thumbnailUrl,
        "summary": summary,
        "saved": saved,
        "rate": rate
      };
}
