import 'package:flutter/material.dart';
import 'package:pegboard_trainer/model/train_config.dart';

class TrainConfigCard extends StatelessWidget {
  const TrainConfigCard({super.key, required this.config});
  final TrainConfig config;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(config.holes.length.toString()),
    );
  }
}
