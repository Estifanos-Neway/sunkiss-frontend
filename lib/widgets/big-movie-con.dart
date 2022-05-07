import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:sunkiss/models/movie.dart';
import 'package:sunkiss/commons/variables.dart';

class BigMovieCon extends StatefulWidget {
  final Movie movie;
  const BigMovieCon({Key? key, required Movie this.movie}) : super(key: key);

  @override
  State<BigMovieCon> createState() => _BigMovieConState();
}

class _BigMovieConState extends State<BigMovieCon> {
  List<Color> _gradientColors = local_defaultGradientColors;

  @override
  initState() {
    super.initState();
    PaletteGenerator.fromImageProvider(
      AssetImage(widget.movie.thumbnailUrl),
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
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: _gradientColors,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.asset(
              widget.movie.thumbnailUrl,
              width: 80,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 2, 0, 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: local_colors["onSurface"],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Text(
                      widget.movie.summary,
                      style: TextStyle(
                        fontSize: 12,
                        color: local_colors["onSurface"],
                      ),
                      softWrap: true,
                    ),
                  ),
                  Divider(
                    color: local_colors["primary"],
                    thickness: 1,
                    endIndent: 40,
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
                      Expanded(
                        child: Row(),
                      ),
                      Icon(
                        Icons.bookmark_border_outlined,
                        color: local_colors["onSurface"],
                        size: 18,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
