import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "FEB",
                style: TextStyle(fontSize: 14, color: kGreyColor),
              ),
              Text(
                "11",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidget(),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "TALLGIRL 2",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      CustomButton(
                        icon: Icons.alarm,
                        title: "Remind me",
                        iconSize: 20,
                        textSize: 10,
                      ),
                      kWidth,
                      CustomButton(
                        icon: Icons.info,
                        title: "Info",
                        iconSize: 20,
                        textSize: 10,
                      ),
                      kWidth
                    ],
                  ),
                ],
              ),
              const Text("Coming on friday"),
              kHeight,
              const Text(
                "Tall Girl 2",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              kHeight,
              const Text(
                "Landing the lead in the school musical its a dream\ncome true for jodi,until the pressure,sends her\nconfidence--and her relationship--into a\ntailspin.",
                style: TextStyle(color: kGreyColor, fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
