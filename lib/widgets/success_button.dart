import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/logic/provider.dart';
import 'package:provider/provider.dart';

class SuccessButton extends StatelessWidget {
  final int moneyInGame;
  final int levelNumber;
  const SuccessButton({
    super.key,
    required this.moneyInGame,
    required this.levelNumber,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final int newMoney = moneyInGame + (levelNumber + 1) * 100;
        Provider.of<MainProvider>(context, listen: false).updateMoney(newMoney);
        final int newLevel = levelNumber + 1;
        Provider.of<MainProvider>(context, listen: false).updateLevel(newLevel);
        context.pop();
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      child: const Text(
        "Claim",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
