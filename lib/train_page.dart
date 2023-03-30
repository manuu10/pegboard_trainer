import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pegboard_trainer/components/pegboard.dart';
import 'package:pegboard_trainer/model/peg_hole.dart';

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

  void onStart() {
    Random rnd = new Random();
    int iteration = 0;
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      iteration++;
      if (iteration > 100 || !mounted) {
        timer.cancel();
      }
      PegHole pegHole;
      int tries = 0;
      while (true) {
        int col = rnd.nextInt(8);
        int row = rnd.nextInt(4);
        pegHole = PegHole(position: Vec2i(col, row));
        bool inList = holes.any((e) => e.position == pegHole.position);
        if (!inList) {
          break;
        }
        if (++tries > 20) {
          break;
        }
      }

      setState(() {
        holes.add(pegHole);
        if (holes.length > 3) {
          holes.removeAt(0);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Pegboard(
          activeHoles: holes,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: onStart,
          child: Text("Start Training"),
        )
      ],
    );
  }
}
