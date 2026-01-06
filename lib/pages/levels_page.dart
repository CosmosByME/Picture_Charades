import 'package:flutter/material.dart';
// import 'package:myapp/pages/intro.dart';
import 'package:myapp/logic/levels.dart';
import 'package:myapp/pages/game.dart';
import 'package:myapp/pages/intro.dart';

class LevelsScreen extends StatefulWidget {
  final int money;
  final int level;
  const LevelsScreen({super.key, required this.money, required this.level});

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  List<Level> levelsList = [];
  int level = 0;
  int money = 0;
  @override
  void initState() {
    super.initState();
    levelsList = levels;
    money = widget.money;
    level = widget.level;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        centerTitle: true,
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
                      "\$ $money",
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
                  MaterialPageRoute(builder: (context) => Intro()),
                );
              },
              icon: Icon(Icons.home, size: 30),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: levelsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (index <= level) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(
                      levelNumber: index,
                      money: money,
                      currentLevel: levelsList[index],
                    ),
                  ),
                );
              }
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(15)),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                height: 80,
                child: ListTile(
                  trailing: index > level
                      ? Icon(Icons.lock, color: Colors.grey.shade600)
                      : null,
                  title: Text(
                    "Level ${index + 1}",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  tileColor: index <= level
                      ? levelColors[index % levelColors.length]
                      : Colors.grey.shade400,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

final levelColors = [
  Color(0xFFFF6F61),
  Color(0xFFFFD93D),
  Color(0xFF6BCB77),
  Color(0xFF4D96FF),
  Color(0xFF845EC2),
  Color(0xFFFF9671),
  Color(0xFF00C9A7),
];
