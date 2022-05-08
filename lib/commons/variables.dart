import 'package:flutter/material.dart';

const Map<String, Color> local_colors = {
  "primary": Color.fromARGB(255, 43, 188, 179),
  "background": Color.fromRGBO(224, 224, 224, 0.8),
  "onBackground": Color.fromARGB(255, 39, 39, 39),
  "surface": Color.fromRGBO(29, 29, 29, 1),
  "onSurface": Color.fromRGBO(224, 224, 224, 0.8),
  "bars": Color.fromARGB(255, 244, 244, 244),
};

List<Color> local_defaultGradientColors = [
  local_colors["background"]!,
  local_colors["surface"]!
];

const String local_platformDisplayName = "sunkiss";
const String local_defaultContentThumbnail = "content.jpg";
