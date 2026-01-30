import 'package:flutter/material.dart';
import 'package:myapp/logic/levels.dart';
import 'package:myapp/logic/provider.dart';
import 'package:myapp/widgets/dropping_place.dart';
import 'package:myapp/widgets/frame.dart';
import 'package:myapp/widgets/hint.dart';
import 'package:myapp/widgets/home_button.dart';
import 'package:myapp/widgets/level_indicator.dart';
import 'package:myapp/widgets/money_indicator_for_game.dart';
import 'package:myapp/widgets/options_bar.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  final Level currentLevel;
  const GameScreen({
    super.key,
    required this.currentLevel,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late int moneyInGame;
  late int levelNumber;
  late int maxLevel;
  late Image firstImage;
  late Image secondImage;
  late String hint;
  late String answer;
  late List<String?> droppedLetters;
  List<String?> options = [];

  @override
  void initState() {
    super.initState();
    moneyInGame = Provider.of<MainProvider>(context).money;
    levelNumber = Provider.of<MainProvider>(context).currentIndex;
    maxLevel = Provider.of<MainProvider>(context).level;
    firstImage = widget.currentLevel.firstImage;
    secondImage = widget.currentLevel.secondImage;
    hint = widget.currentLevel.hint;
    answer = widget.currentLevel.answer;
    droppedLetters = List.filled(widget.currentLevel.answer.length, null);
    options.addAll(widget.currentLevel.options.toList()..shuffle());
  }

  void restart() {
    setState(() {
      droppedLetters = List.filled(answer.length, null);
      options.clear();
      options.addAll(widget.currentLevel.options.toList()..shuffle());
    });
  }

  void putting(int index, String letter) {
    setState(() {
      droppedLetters[index] = letter;
      options.remove(letter);
    });
  }

  void reputting(int index, String? letter) {
    setState(() {
      droppedLetters[index] = null;
      options.add(letter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        centerTitle: true,
        leading: LevelIndicator(levelNumber: levelNumber),
        title: MoneyIndicatorForGame(),
        actions: [
          IconButton(onPressed: restart, icon: Icon(Icons.replay))
          ,HomeButton(
            money: moneyInGame,
            maxLevel: maxLevel,
            levelNumber: levelNumber,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Expanded(flex: 2, child: SizedBox()),
            Expanded(
              flex: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Frame(image: firstImage, color: Colors.red, full: widget.currentLevel.firstWord, part: widget.currentLevel.hintForFirstWord,),
                  Frame(image: secondImage, color: Colors.blue, full: widget.currentLevel.secondWord, part: widget.currentLevel.hintForSecondWord,),
                ],
              ),
            ),
            const Expanded(flex: 2, child: SizedBox()),
            Hint(hint: hint),
            DroppingPlace(
              reputting: reputting,
              putting: putting,
              restart: restart,
              answer: answer,
              options: options,
              droppedLetters: droppedLetters,
              levelNumber: levelNumber,
              maxLevel: maxLevel,
              moneyInGame: moneyInGame,
              currentLevel: widget.currentLevel,
            ),
            const Expanded(flex: 2, child: SizedBox()),
            OptionsBar(options: options),
            const Expanded(flex: 2, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
