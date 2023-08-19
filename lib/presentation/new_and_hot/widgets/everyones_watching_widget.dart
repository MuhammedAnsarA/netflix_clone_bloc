import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        kHeight,
        const Text(
          "Friends",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "This hit sitcome follows the merry misadventures of six\n20-something pals as they navigate the pitfalls of\nwork,life and love in 1990s Manhattan.",
          style: TextStyle(color: kGreyColor, fontSize: 14),
        ),
        kHeight50,
        const VideoWidget(),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButton(
              icon: Icons.share,
              title: "Share",
              iconSize: 30,
              textSize: 16,
            ),
            kWidth,
            CustomButton(
              icon: Icons.add,
              title: "My List",
              iconSize: 30,
              textSize: 16,
            ),
            kWidth,
            CustomButton(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 30,
              textSize: 16,
            ),
            kWidth,
          ],
        ),
      ],
    );
  }
}
