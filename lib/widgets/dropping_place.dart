import 'package:flutter/material.dart';
import 'package:myapp/components/fail.dart';
import 'package:myapp/components/success.dart';
import 'package:myapp/logic/levels.dart';

class DroppingPlace extends StatefulWidget {
  final Function(int, String) reputting;
  final Function(int, String) putting;
  final VoidCallback restart;
  final String answer;
  final List<String?> options;
  final List<String?> droppedLetters;
  final int levelNumber;
  final int moneyInGame;
  final Level currentLevel;

  const DroppingPlace({
    super.key,
    required this.answer,
    required this.options,
    required this.droppedLetters,
    required this.levelNumber,
    required this.moneyInGame,
    required this.currentLevel,
    required this.restart,
    required this.putting,
    required this.reputting,
  });

  @override
  State<DroppingPlace> createState() => _DroppingPlaceState();
}

class _DroppingPlaceState extends State<DroppingPlace> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 34, 37, 121),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.only(top: 30, bottom: 30),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            children: List.generate(
              widget.answer.length,
              (index) => DragTarget<String>(
                onAcceptWithDetails: (letter) async {
                  widget.putting(index, letter.data);

                  if (!widget.droppedLetters.contains(null)) {
                    if (widget.droppedLetters.join().toLowerCase() ==
                        widget.answer.toLowerCase()) {
                      await success(
                        levelNumber: widget.levelNumber,
                        moneyInGame: widget.moneyInGame,
                        context: context,
                      );
                    } else {
                      fail(
                        restart: widget.restart,
                        context: context,
                        moneyInGame: widget.moneyInGame,
                        currentLevel: widget.currentLevel,
                        levelNumber: widget.levelNumber,
                      );
                    }
                  }
                },
                builder: (context, candidateData, rejectedData) {
                  final letter = widget.droppedLetters[index];
                  return Container(
                    width: 45,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: letter == null
                        ? const ColoredBox(color: Colors.grey)
                        : Card(
                            color: Colors.blueGrey.shade900,
                            child: Center(
                              child: Text(
                                letter,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
