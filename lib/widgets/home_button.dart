import 'package:flutter/material.dart';
import 'package:myapp/logic/data.dart';

class HomeButton extends StatelessWidget {
  final int money;
  final int maxLevel;
  final int levelNumber;
  const HomeButton({
    super.key,
    required this.money,
    required this.maxLevel,
    required this.levelNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: IconButton(
        onPressed: () {
          Navigator.pop(
            context,
            Data(
              money: money,
              levelNumber: maxLevel <= levelNumber ? levelNumber : maxLevel,
            ),
          );
        },
        icon: Icon(Icons.home, size: 30),
      ),
    );
  }
}
