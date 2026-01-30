import 'package:flutter/material.dart';
import 'package:myapp/logic/provider.dart';
import 'package:provider/provider.dart';

class MoneyIndicator extends StatelessWidget {
  const MoneyIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    int money = Provider.of<MainProvider>(context).money;
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: money),
      duration: const Duration(milliseconds: 800),
      builder: (context, value, _) {
        return _Indicator(value);
      },
    );
  }
}

class _Indicator extends StatelessWidget {
  final int money;
  const _Indicator(this.money);

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
