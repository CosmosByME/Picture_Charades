import 'package:flutter/material.dart';
import 'package:myapp/logic/data.dart';

class SuccessButton extends StatelessWidget {
  final int moneyInGame;
  final int levelNumber;
  const SuccessButton({super.key, required this.moneyInGame, required this.levelNumber});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final int newMoney = moneyInGame + (levelNumber + 1) * 100;
        final int newLevel = levelNumber + 1;
        Navigator.pop(
          context,
          Data(levelNumber: newLevel, money: newMoney),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      child: const Text("Claim", style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
