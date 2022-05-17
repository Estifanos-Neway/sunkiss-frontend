import 'package:Sunkiss/data/content-list.dart';
import 'package:Sunkiss/models/content.dart';

class ContentBloc {
  List<Content> contents =
      contentList.map((element) => Content.fromJson(element)).toList();

  void handleSave(int index) {
    contents[index].saved = !contents[index].saved;
  }

  void handleRating(int index, int rates) {
    contents[index].rate = rates;
  }
}
