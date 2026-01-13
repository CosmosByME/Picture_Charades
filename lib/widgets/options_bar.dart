import 'package:flutter/material.dart';

class OptionsBar extends StatefulWidget {
  final List<String?> options;
  const OptionsBar({super.key, required this.options});

  @override
  State<OptionsBar> createState() => _OptionsBarState();
}

class _OptionsBarState extends State<OptionsBar> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      children: List.generate(
        widget.options.length,
        (index) => Draggable<String>(
          data: widget.options[index],
          feedback: Card(
            color: Colors.blueGrey.shade900,
            child: Container(
              width: 45,
              height: 45,
              alignment: Alignment.center,
              child: Text(
                widget.options[index]!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          childWhenDragging: SizedBox(),
          child: Card(
            color: Colors.blueGrey.shade900,
            child: Container(
              width: 45,
              height: 45,
              alignment: Alignment.center,
              child: Text(
                widget.options[index]!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
