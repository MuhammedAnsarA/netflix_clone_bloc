import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../widgets/main_titile.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: "Top 10 Tv Shows In India Today"),
        kHeight,
        LimitedBox(
          maxHeight: 170,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => NumberCard(index: index),
            ),
          ),
        ),
      ],
    );
  }
}
