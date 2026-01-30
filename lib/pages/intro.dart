import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40.0),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/intro.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: TweenAnimationBuilder<double>(
          duration: Duration(seconds: 5),
          tween: Tween(begin: 0, end: 1),
          builder: (context, value, _) {
            return LinearProgressIndicator(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              value: value, // Value between 0.0 and 1.0
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
              minHeight: 24, // Adjust the thickness of the line
            );
          },
          onEnd: () {
            context.pushReplacement('/levels');
          },
        ),
      ),
    );
  }
}