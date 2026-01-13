import 'package:flutter/material.dart';
import 'package:myapp/logic/levels.dart';

class FailButton extends StatelessWidget {
  final VoidCallback restart;
  final int moneyInGame;
  final Level level;
  final int levelNumber;
  final int maxLevel;

  const FailButton({
    super.key,
    required this.moneyInGame,
    required this.level,
    required this.levelNumber,
    required this.maxLevel, required this.restart,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
        restart();
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
      child: const Text(
        "Back",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
