import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:myapp/logic/data.dart';
// import 'package:myapp/pages/intro.dart';
import 'package:myapp/logic/levels.dart';
import 'package:myapp/logic/provider.dart';
// import 'package:myapp/pages/game.dart';
import 'package:myapp/widgets/money_indicator.dart';
import 'package:provider/provider.dart';

class LevelsScreen extends StatefulWidget {
  const LevelsScreen({super.key});

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
    money = Provider.of<MainProvider>(context, listen: false).money;
    level = Provider.of<MainProvider>(context, listen: false).level;
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
              title: MoneyIndicator(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: levelsList.length,
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index <= level) {
                        context.go(
                          '/levels/${index + 1}/game',
                          extra: levelsList[index],
                        );
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
