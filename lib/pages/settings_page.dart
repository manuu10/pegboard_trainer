import 'package:flutter/material.dart';
import 'package:pegboard_trainer/app_styles.dart';
import 'package:pegboard_trainer/components/number_input.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          "Board Size",
          style: AppStyles.headline(),
        ),
        Row(
          children: [
            Expanded(
              child: NumberInput(
                value: 0,
                onChange: (v) {},
                label: Text(
                  "Columns",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Expanded(
              child: NumberInput(
                value: 0,
                onChange: (v) {},
                label: Text(
                  "Rows",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
