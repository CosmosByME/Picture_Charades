import 'package:flutter/material.dart';

class Hint extends StatelessWidget {
  final String hint;
  const Hint({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 34, 37, 121),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            hint,
            style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
