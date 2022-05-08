import 'package:flutter/material.dart';
import 'package:sunkiss/commons/variables.dart';

class ReactionBar extends StatelessWidget {
  final bool saved;
  final int rate;
  const ReactionBar({Key? key, this.rate = 0, this.saved = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 64,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                (index) {
                  return Icon(
                    index < rate ? Icons.star : Icons.star_border,
                    color: local_colors["onSurface"],
                    size: 18,
                  );
                },
              )
              //  [
              //   Icon(
              //     Icons.star_border,
              //     color: local_colors["onSurface"],
              //     size: 18,
              //   ),
              //   Icon(
              //     Icons.star_border,
              //     color: local_colors["onSurface"],
              //     size: 18,
              //   ),
              //   Icon(
              //     Icons.star_border,
              //     color: local_colors["onSurface"],
              //     size: 18,
              //   ),
              // ],
              ),
        ),
        Expanded(
          child: Row(),
        ),
        Icon(
          saved ? Icons.bookmark : Icons.bookmark_border_outlined,
          color: local_colors["onSurface"],
          size: 18,
        ),
      ],
    );
  }
}
