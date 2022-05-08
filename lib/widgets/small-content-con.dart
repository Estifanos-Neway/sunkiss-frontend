import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:sunkiss/commons/variables.dart';
import 'package:sunkiss/models/content.dart';
import 'package:sunkiss/widgets/reactionBar.dart';

class SmallContentCon extends StatefulWidget {
  final Content content;
  const SmallContentCon({Key? key, required this.content}) : super(key: key);
  @override
  State<SmallContentCon> createState() => _SmallContentConState();
}

class _SmallContentConState extends State<SmallContentCon> {
  List<Color> _gradientColors = local_defaultGradientColors;

  @override
  initState() {
    super.initState();
    PaletteGenerator.fromImageProvider(
      AssetImage(widget.content.thumbnailUrl),
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
        child: IntrinsicWidth(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.asset(
                  widget.content.thumbnailUrl,
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
                  widget.content.title,
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
                    child: const SizedBox(
                      width: 80,
                      height: 1,
                    ),
                  ),
                  ReactionBar(
                    rate: widget.content.rate,
                    saved: widget.content.saved,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}