import 'package:flutter/material.dart';
import 'package:myapp/logic/provider.dart';
import 'package:provider/provider.dart';

class MoneyIndicatorForGame extends StatelessWidget {
  const MoneyIndicatorForGame({super.key});

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
            "\$ ${Provider.of<MainProvider>(context, listen: false).money}",
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
