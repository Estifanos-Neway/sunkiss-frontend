import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:Sunkiss/commons/variables.dart';
import 'package:Sunkiss/models/content.dart';
import 'package:Sunkiss/widgets/reaction-bar.dart';

class SmallContentCon extends StatefulWidget {
  final int ref;
  final Content content;
  SmallContentCon({Key? key, required this.content})
      : ref = content.id,
        super(key: key);
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
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  5,
                  0,
                  17,
                ),
                child: Text(
                  widget.content.title,
                  style: TextStyle(
                    fontSize: 18,
                    color: local_colors["whiteText"],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    decoration: BoxDecoration(
                      color: local_colors["primary"],
                    ),
                    child: const SizedBox(
                      width: 110,
                      height: 1,
                    ),
                  ),
                  ReactionBar(
                    ref: widget.content.id,
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
