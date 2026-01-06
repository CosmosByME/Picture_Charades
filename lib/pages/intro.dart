import 'package:flutter/material.dart';
import 'package:myapp/pages/levels_page.dart';

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
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LevelsScreen(money: 0, level: 0,)),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 84, 212, 88),
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text(
            "Let's play",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 40,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
