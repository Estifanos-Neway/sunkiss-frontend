import 'package:Sunkiss/states/app-state.dart';
import 'package:flutter/material.dart';
import 'package:Sunkiss/commons/variables.dart';

class ReactionBar extends StatelessWidget {
  final int ref;
  final bool saved;
  final int rate;
  const ReactionBar(
      {Key? key, required this.ref, this.rate = 0, this.saved = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleSave() {
      AppStateController.of(context).handleSave(ref);
    }

    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                (index) {
                  void handleRating() {
                    AppStateController.of(context).handleRating(ref, index + 1);
                  }
        
                  return GestureDetector(
                    onTap: handleRating,
                    child: Icon(
                      index < rate ? Icons.star : Icons.star_border,
                      color: local_colors["onSurface"],
                      size: 23.5,
                    ),
                  );
                },
              )),
        ),
        Expanded(
          child: Row(),
        ),
        GestureDetector(
          onTap: handleSave,
          child: Icon(
            saved ? Icons.bookmark : Icons.bookmark_border_outlined,
            color: local_colors["onSurface"],
            size: 23.5,
          ),
        ),
      ],
    );
  }
}
