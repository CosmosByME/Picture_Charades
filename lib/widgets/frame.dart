import 'package:flutter/material.dart';

class Frame extends StatefulWidget {
  final int full;
  final int part;
  final Image image;
  final Color color;
  const Frame({
    super.key,
    required this.image,
    required this.color,
    required this.full,
    required this.part,
  });

  @override
  State<Frame> createState() => _FrameState();
}

class _FrameState extends State<Frame> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 240,
        width: 160,
        child: Column(
          children: [
            Expanded(flex: 16, child: InteractiveViewer(child: widget.image)),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          for (int i = 0; i < widget.part; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 3,
                              ),
                              child: _dot(color: widget.color, size: 8),
                            ),
                        ],
                      ),
                    ),
                    // inactive dots BEFORE
                    for (int i = 0; i < widget.full - widget.part; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: _dot(
                          color: Colors.white.withOpacity(0.7),
                          size: 6,
                        ),
                      ),

                    // active dots container
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _dot({required Color color, double size = 8}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}
