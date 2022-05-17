import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:Sunkiss/models/content.dart';
import 'package:Sunkiss/commons/variables.dart';
import 'package:Sunkiss/widgets/reactionBar.dart';

class BigContentCon extends StatefulWidget {
  final int ref;
  final Content content;
  BigContentCon({Key? key, required this.content})
      : ref = content.id,
        super(key: key);

  @override
  State<BigContentCon> createState() => _BigContentConState();
}

class _BigContentConState extends State<BigContentCon> {
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
              widget.content.thumbnailUrl,
              width: 100,
              height: 175,
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
                    widget.content.title,
                    style: TextStyle(
                      fontSize: 21.5,
                      fontWeight: FontWeight.bold,
                      color: local_colors["onSurface"],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Text(
                      widget.content.summary,
                      style: TextStyle(
                        fontSize: 16,
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
                  ReactionBar(
                    ref: widget.ref,
                    rate: widget.content.rate,
                    saved: widget.content.saved,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
