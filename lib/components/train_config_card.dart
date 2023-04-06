import 'package:flutter/material.dart';
import 'package:pegboard_trainer/app_styles.dart';
import 'package:pegboard_trainer/model/train_config.dart';

class TrainConfigCard extends StatelessWidget {
  const TrainConfigCard({super.key, required this.config});
  final TrainConfig config;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "Configuration",
                style: AppStyles.headline4(Colors.red),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.numbers),
                    const SizedBox(width: 10),
                    Text("${config.holes.length} Moves"),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.rectangle_rounded),
                    const SizedBox(width: 10),
                    Text(
                      "${config.usedArea.bottomRight.x + 1} x ${config.usedArea.bottomRight.y + 1}",
                    ),
                  ],
                ),
                const Divider(),
                Text("Biggest Move", style: AppStyles.dimmed()),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text("${config.longestMove.x.abs()}"),
                    const SizedBox(width: 5),
                    Icon(config.longestMove.x.isNegative
                        ? Icons.arrow_circle_left_outlined
                        : Icons.arrow_circle_right_outlined),
                    const SizedBox(width: 10),
                    Icon(config.longestMove.y.isNegative
                        ? Icons.arrow_circle_up_outlined
                        : Icons.arrow_circle_down_outlined),
                    const SizedBox(width: 5),
                    Text("${config.longestMove.y.abs()}"),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
