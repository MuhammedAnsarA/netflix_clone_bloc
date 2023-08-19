import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              width: 125,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://www.themoviedb.org/t/p/w440_and_h660_face/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg"),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 34,
          child: BorderedText(
            strokeColor: Colors.white,
            strokeWidth: 5.0,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                fontSize: 140,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                decorationColor: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
