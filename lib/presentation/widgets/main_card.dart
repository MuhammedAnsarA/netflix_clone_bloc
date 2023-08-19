import 'package:flutter/material.dart';

import '../../core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
          height: 170,
        ),
        Container(
          width: 125,
          height: 170,
          decoration: BoxDecoration(
            borderRadius: kRadius10,
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://www.themoviedb.org/t/p/w440_and_h660_face/nCzzQKGijVzfGFg42id7uDLOjY5.jpg"),
            ),
          ),
        ),
      ],
    );
  }
}
