import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/constants.dart';
import 'custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 550,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(kMainImage),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButton(icon: Icons.add, title: "My List"),
                _playButton(),
                const CustomButton(icon: Icons.info, title: "Info"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kWhiteColor),
      ),
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: kBlackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Play",
          style: TextStyle(fontSize: 20, color: kBlackColor),
        ),
      ),
    );
  }
}
