import 'package:flutter/material.dart';
import 'package:pegboard_trainer/components/number_input.dart';
import 'package:pegboard_trainer/model/train_config.dart';

class TrainConfigBottomSheet extends StatefulWidget {
  const TrainConfigBottomSheet({super.key});

  static Future<TrainConfig?> show(BuildContext context) async {
    final res = await showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: TrainConfigBottomSheet(),
        );
      },
    );

    if (res is RandomTrainConfig) {
      return TrainConfig.generate(res, 1000);
    }
    return null;
  }

  @override
  State<TrainConfigBottomSheet> createState() => _TrainConfigBottomSheetState();
}

class _TrainConfigBottomSheetState extends State<TrainConfigBottomSheet> {
  RandomTrainConfig trainConfig =
      RandomTrainConfig(numberOfMoves: 10, columns: 8, rows: 4);

  void setTrainConfig(RandomTrainConfig config) {
    setState(() {
      trainConfig = config;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Create Config",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: NumberInput(
                  value: trainConfig.numberOfMoves,
                  onChange: (v) =>
                      setTrainConfig(trainConfig.copyWith(numberOfMoves: v)),
                  label: const Text(
                    "Number Moves",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: NumberInput(
                  value: trainConfig.distinctForXMoves,
                  onChange: (v) => setTrainConfig(
                      trainConfig.copyWith(distinctForXMoves: v)),
                  label: const Text(
                    "Distinct Moves",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: NumberInput(
                  value: trainConfig.minMoveDistance,
                  onChange: (v) =>
                      setTrainConfig(trainConfig.copyWith(minMoveDistance: v)),
                  label: const Text(
                    "Min Move Distance",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: NumberInput(
                  value: trainConfig.maxMoveDistance,
                  onChange: (v) =>
                      setTrainConfig(trainConfig.copyWith(maxMoveDistance: v)),
                  label: const Text(
                    "Max Move Distance",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Divider(),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 139, 40, 40),
                    foregroundColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: () => Navigator.of(context).pop(trainConfig),
                  child: Text("Create"),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(110, 0, 0, 0)),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancel"),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
