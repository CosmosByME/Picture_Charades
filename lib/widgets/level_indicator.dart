import 'package:flutter/material.dart';

class LevelIndicator extends StatelessWidget {
  final int levelNumber;
  const LevelIndicator({super.key, required this.levelNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Level", style: TextStyle(fontSize: 15)),
        Text("${levelNumber+1}", style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
