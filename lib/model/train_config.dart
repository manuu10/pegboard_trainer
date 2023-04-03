// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:pegboard_trainer/model/peg_hole.dart';

class TrainConfig {
  final List<PegHole> holes;
  final int timeForMoveInMs;
  TrainConfig({
    required this.holes,
    required this.timeForMoveInMs,
  });

  static TrainConfig generate(RandomTrainConfig config, int timeForMoveInMs) {
    List<PegHole> temp = [];
    Random rnd = Random();
    while (temp.length < config.numberOfMoves) {
      PegHole pegHole;
      int tries = 0;
      final subList = temp.reversed.take(config.distinctForXMoves);
      while (true) {
        int col = rnd.nextInt(config.columns);
        int row = rnd.nextInt(config.rows);
        pegHole = PegHole(position: Vec2i(col, row));
        bool inList = subList.any((e) => e.position == pegHole.position);
        if (!inList) {
          break;
        }
        if (++tries > 20) {
          break;
        }
      }
      temp.add(pegHole);
    }

    return TrainConfig(holes: temp, timeForMoveInMs: timeForMoveInMs);
  }
}

class RandomTrainConfig {
  final int numberOfMoves;
  final int maxMoveDistance;
  final int minMoveDistance;
  final int distinctForXMoves;
  final int columns;
  final int rows;
  RandomTrainConfig({
    required this.numberOfMoves,
    this.maxMoveDistance = 4,
    this.minMoveDistance = 1,
    this.distinctForXMoves = 4,
    required this.columns,
    required this.rows,
  });

  RandomTrainConfig copyWith({
    int? numberOfMoves,
    int? maxMoveDistance,
    int? minMoveDistance,
    int? distinctForXMoves,
    int? columns,
    int? rows,
  }) {
    return RandomTrainConfig(
      numberOfMoves: numberOfMoves ?? this.numberOfMoves,
      maxMoveDistance: maxMoveDistance ?? this.maxMoveDistance,
      minMoveDistance: minMoveDistance ?? this.minMoveDistance,
      distinctForXMoves: distinctForXMoves ?? this.distinctForXMoves,
      columns: columns ?? this.columns,
      rows: rows ?? this.rows,
    );
  }
}
