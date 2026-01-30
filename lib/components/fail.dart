import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/logic/levels.dart';
import 'package:myapp/widgets/fail_button.dart';

void fail({
  required VoidCallback restart,
  required BuildContext context,
  required int moneyInGame,
  required Level currentLevel,
  required int levelNumber,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Lottie.asset(
                "assets/animations/Tomato Error.json",
                width: 200,
                height: 200,
              ),
              const Text(
                "Try again!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(height: 20),
              FailButton(
                restart: restart,
                moneyInGame: moneyInGame,
                level: currentLevel,
                levelNumber: levelNumber,
              ),
            ],
          ),
        ),
      );
    },
  );
}
