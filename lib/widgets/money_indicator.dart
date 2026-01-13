import 'package:flutter/material.dart';

class MoneyIndicator extends StatelessWidget {
  final int money;
  const MoneyIndicator({super.key, required this.money});

  @override
  Widget build(BuildContext context) {
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
