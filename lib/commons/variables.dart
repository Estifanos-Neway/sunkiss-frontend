import 'package:flutter/material.dart';

const Map<String, Color> local_colors = {
  "primary": Color.fromARGB(255, 43, 188, 179),
  "background": Color(0xFFF2F2F2),
  "onBackground": Color(0xFF303030),
  "surface": Color.fromRGBO(255, 255, 255, 1),
  "onSurface": Color(0xFF303030),
  "whiteText":Color.fromRGBO(224, 224, 224, 0.8),
  "link":Color(0xFF00ACD1),
  "danger":Color.fromARGB(255, 193, 0, 0),
};
const Map<String, Color> local_colors_dark = {
  "background": Color.fromARGB(255, 39, 39, 39),
};

List<Color> local_defaultGradientColors = [
  local_colors["surface"]!,
  local_colors["onBackground"]!
];

const String local_platformDisplayName = "sunkiss";
const String local_defaultContentThumbnail = "content.jpg";
