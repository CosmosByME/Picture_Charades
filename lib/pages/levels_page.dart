import 'package:flutter/material.dart';
import 'package:myapp/logic/data.dart';
// import 'package:myapp/pages/intro.dart';
import 'package:myapp/logic/levels.dart';
import 'package:myapp/pages/game.dart';
import 'package:myapp/widgets/money_indicator.dart';

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

  Future<void> getting(int index) async {
    final Data? result = await Navigator.push<Data>(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(
          maxLevel: level,
          levelNumber: index,
          money: money,
          currentLevel: levelsList[index],
        ),
      ),
    );

    if (result != null) {
      setState(() {
        money = result.money;
        level = result.levelNumber;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 2.2,
            colors: [
              Color(0x26FFD93D), // VERY subtle warm gold (15% opacity)
              Colors.transparent,
            ],
          ),
        ),
        child: CustomScrollView(
          key: PageStorageKey("levels"),
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.transparent,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              centerTitle: true,
              title: MoneyIndicator(money: money),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: levelsList.length,
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index <= level) {
                        getting(index);
                      }
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(15),
                        ),
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
            ),
          ],
        ),
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
