import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/logic/data.dart';
import 'package:myapp/widgets/success_button.dart';

Future<void> success({
  required int levelNumber,
  required int moneyInGame,
  required BuildContext context,
}) async {
  final Data? result = await showDialog<Data>(
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
                "assets/animations/Dollar Coins Chest.json",
                width: 250,
                height: 250,
              ),
              const Text("Congratulations!", style: TextStyle(fontSize: 24)),
              const SizedBox(height: 20),
              Text(
                "+${(levelNumber + 1) * 100} Coins",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(255, 252, 182, 42),
                ),
              ),
              const SizedBox(height: 20),
              SuccessButton(moneyInGame: moneyInGame, levelNumber: levelNumber),
            ],
          ),
        ),
      );
    },
  );

  if (result != null) {
    Navigator.pop(context, result);
  }
}
