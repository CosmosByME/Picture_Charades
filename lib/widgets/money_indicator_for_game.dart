import 'package:flutter/material.dart';

class MoneyIndicatorForGame extends StatelessWidget {
  final int money;
  const MoneyIndicatorForGame({super.key, required this.money});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 125,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Image.asset("assets/images/coin.png", width: 24),
          const SizedBox(width: 6),
          Text(
            "\$ $money",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
