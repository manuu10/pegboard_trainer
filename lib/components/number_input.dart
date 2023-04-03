import 'package:flutter/material.dart';

class NumberInput extends StatelessWidget {
  const NumberInput(
      {super.key, required this.value, required this.onChange, this.label});
  final int value;
  final void Function(int value) onChange;
  final Widget? label;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null) label!,
            if (label != null) const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => onChange(value - 1),
                  child: const Icon(Icons.remove),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      value.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => onChange(value + 1),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
