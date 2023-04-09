import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pegboard_trainer/components/pegboard.dart';
import 'package:pegboard_trainer/components/train_config_bottom_sheet.dart';
import 'package:pegboard_trainer/components/train_config_card.dart';
import 'package:pegboard_trainer/model/peg_hole.dart';
import 'package:pegboard_trainer/model/train_config.dart';

import '../model/math/vec2i.dart';

class TrainPage extends StatefulWidget {
  const TrainPage({Key? key}) : super(key: key);

  @override
  State<TrainPage> createState() => _TrainPageState();
}

class _TrainPageState extends State<TrainPage> {
  List<PegHole> holes = [
    PegHole(position: Vec2i(7, 3)),
    PegHole(position: Vec2i(7, 0)),
    PegHole(position: Vec2i(0, 3)),
    PegHole(position: Vec2i(0, 0)),
  ];
  TrainConfig? train;
  bool finished = false;
  bool showUsedArea = false;

  void onStart() async {
    if (train == null) return;
    holes.clear();
    setState(() {
      finished = false;
    });

    for (var h in train!.holes) {
      if (!mounted) return;
      setState(() {
        holes.add(h);
        if (holes.length > 3) {
          holes.removeAt(0);
        }
      });
      await Future.delayed(Duration(milliseconds: train!.timeForMoveInMs));
    }
    setState(() {
      finished = true;
    });
  }

  void toggleUsedArea() {
    setState(() {
      showUsedArea = !showUsedArea;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Pegboard(
          activeHoles: holes,
          markedRegion: showUsedArea ? train?.usedArea : null,
        ),
        if (finished) Text("Finished"),
        if (train != null) const SizedBox(height: 20),
        if (train != null)
          TrainConfigCard(
            config: train!,
            onToggleAreaClick: toggleUsedArea,
            usedAreaIsVisible: showUsedArea,
          ),
        if (train != null) const SizedBox(height: 20),
        if (train != null)
          ElevatedButton(
            onPressed: onStart,
            child: Text("Start Training"),
          ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            final res = await TrainConfigBottomSheet.show(context);
            if (res != null) {
              setState(() {
                train = res;
              });
            }
          },
          child: Text(
            "${train == null ? "Create New" : "Modify"} Configuration",
          ),
        )
      ],
    );
  }
}
