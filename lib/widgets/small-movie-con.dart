import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:sunkiss/commons/variables.dart';

class SmallMovieCon extends StatefulWidget {
  final String thumbnailUrl;
  final String title;
  const SmallMovieCon(
      {Key? key, required this.thumbnailUrl, required this.title})
      : super(key: key);
  @override
  State<SmallMovieCon> createState() => _SmallMovieConState();
}

class _SmallMovieConState extends State<SmallMovieCon> {
  List<Color> _gradientColors = local_defaultGradientColors;

  @override
  initState() {
    super.initState();
    PaletteGenerator.fromImageProvider(
      AssetImage(widget.thumbnailUrl),
    ).then((paletteGenerator) {
      setState(() {
        _gradientColors = [
          paletteGenerator.dominantColor?.color ??
              local_defaultGradientColors[0],
          local_defaultGradientColors[1],
        ];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: _gradientColors,
            ),
            borderRadius: BorderRadius.circular(7)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.asset(
                widget.thumbnailUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                0,
                5,
                0,
                10,
              ),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 17,
                  color: local_colors["onSurface"],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    color: local_colors["primary"],
                  ),
                  child: SizedBox(
                    width: 80,
                    height: 1,
                    // endIndent: 40,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_border,
                      color: local_colors["onSurface"],
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.star_border,
                      color: local_colors["onSurface"],
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.star_border,
                      color: local_colors["onSurface"],
                      size: 18,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.bookmark_border_outlined,
                      color: local_colors["onSurface"],
                      size: 18,
                    )
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
