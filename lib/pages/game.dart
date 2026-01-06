import 'package:flutter/material.dart';
import 'package:myapp/logic/levels.dart';
import 'levels_page.dart';

class GameScreen extends StatefulWidget {
  final int levelNumber;
  final int money;
  final Level currentLevel;
  const GameScreen({
    super.key,
    required this.levelNumber,
    required this.money,
    required this.currentLevel,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<String?> droppedLetters;
  int? moneyInGame;

  @override
  void initState() {
    super.initState();
    moneyInGame = widget.money;
    droppedLetters = List.filled(widget.currentLevel.answer.length, null);
    widget.currentLevel.options.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        centerTitle: true,
        leading: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Level", style: TextStyle(fontSize: 15)),
            Text("${widget.levelNumber}", style: TextStyle(fontSize: 16)),
          ],
        ),
        title: Container(
          height: 36,
          width: 125,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
          child: ClipRRect(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(2),
                    child: SizedBox.square(
                      child: Image.asset(
                        "assets/images/coin.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "\$ ${moneyInGame!}",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LevelsScreen(
                      money: moneyInGame!,
                      level: widget.levelNumber,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.home, size: 30),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20.0),
        child: Column(
          children: [
            Expanded(flex: 2, child: SizedBox()),
            Expanded(
              flex: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    child: SizedBox(
                      height: 240,
                      width: 160,
                      child: Column(
                        children: [
                          Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                            flex: 5,
                            child: InteractiveViewer(
                              child: widget.currentLevel.firstImage
                            ),
                          ),
                          Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      height: 240,
                      width: 160,
                      child: Column(
                        children: [
                          Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                            flex: 5,
                            child: InteractiveViewer(
                              child: widget.currentLevel.secondImage
                            ),
                          ),
                          Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
            ElevatedButton(
              onPressed: () {
                if (droppedLetters.join().toLowerCase() ==
                    widget.currentLevel.answer.toLowerCase()) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Congratulations!",
                                style: TextStyle(fontSize: 24),
                              ),
                              const SizedBox(height: 20),
                              SizedBox.square(
                                dimension: 36,
                                child: Image.asset(
                                  "assets/images/coin.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "+${(widget.levelNumber + 1) * 100} Coins",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: const Color.fromARGB(
                                    255,
                                    252,
                                    228,
                                    42,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    moneyInGame =
                                        moneyInGame! + (widget.levelNumber + 1) * 100;
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LevelsScreen(
                                          money: moneyInGame!,
                                          level: widget.levelNumber + 1,
                                        ),
                                      ),
                                    );
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                ),
                                child: Text("Claim"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
              ),
              child: Text(
                "Check",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
            Card(
              color: const Color.fromARGB(255, 34, 37, 121),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.currentLevel.hint,
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 34, 37, 121),
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  margin: EdgeInsets.only(top: 30, bottom: 30),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    children: List.generate(
                      widget.currentLevel.answer.length,
                      (index) => DragTarget<String>(
                        onAcceptWithDetails: (letter) {
                          setState(() {
                            droppedLetters[index] = letter.data;
                            widget.currentLevel.options.remove(letter.data);
                          });
                        },
                        builder: (context, candidateData, rejectedData) {
                          final letter = droppedLetters[index];

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
            ),
            Expanded(flex: 2, child: SizedBox()),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              children: List.generate(
                widget.currentLevel.options.length,
                (index) => Draggable<String>(
                  data: widget.currentLevel.options[index],
                  feedback: Card(
                    color: Colors.blueGrey.shade900,
                    child: Container(
                      width: 45,
                      height: 45,
                      alignment: Alignment.center,
                      child: Text(
                        widget.currentLevel.options[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  childWhenDragging: SizedBox(),
                  child: Card(
                    color: Colors.blueGrey.shade900,
                    child: Container(
                      width: 45,
                      height: 45,
                      alignment: Alignment.center,
                      child: Text(
                        widget.currentLevel.options[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(flex: 2, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
