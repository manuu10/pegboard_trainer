import 'package:flutter/material.dart';
import 'package:pegboard_trainer/components/inset_box_decoration.dart';
import 'package:pegboard_trainer/components/inset_box_shadow.dart';
import 'package:pegboard_trainer/model/peg_hole.dart';

import '../model/math/recti.dart';
import '../model/math/vec2i.dart';

class Pegboard extends StatelessWidget {
  const Pegboard({
    super.key,
    this.activeHoles = const [],
    this.onTapHole,
    this.columns = 8,
    this.rows = 4,
    this.markedRegion,
  });

  final int columns;
  final int rows;
  final List<PegHole> activeHoles;
  final RectI? markedRegion;
  final void Function(PegHole hole)? onTapHole;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.amberAccent.shade100,
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://www.textures.com/system/gallery/photos/Wood/Plywood/New/38081/PlywoodNew0046_5_download600.jpg',
              repeat: ImageRepeat.repeat,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
            ),
            itemCount: rows * columns,
            itemBuilder: (context, index) {
              final pegHole = PegHole(
                position: Vec2i.fromIndex(index, columns),
              );
              final selected = activeHoles.any(
                (e) => e.position == pegHole.position,
              );
              return GestureDetector(
                onTap: () => onTapHole?.call(pegHole),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    decoration: InsetBoxDecoration(
                      shape: BoxShape.circle,
                      color: selected
                          ? const Color.fromARGB(255, 85, 255, 94)
                          : const Color.fromARGB(121, 0, 0, 0),
                      boxShadow: const [
                        InsetBoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0),
                          blurRadius: 15,
                          spreadRadius: 5,
                          inset: true,
                        )
                      ],
                    ),
                    child: FittedBox(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
