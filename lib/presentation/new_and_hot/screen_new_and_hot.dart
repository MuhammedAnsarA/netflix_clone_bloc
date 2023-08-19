import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_bloc/core/colors.dart';
import 'package:netflix_bloc/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_bloc/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

import '../../core/constants.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(82),
          child: AppBar(
            title: Text(
              "New & Hot",
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              const Icon(
                Icons.cast,
                size: 30,
                color: Colors.white,
              ),
              kWidth,
              Container(
                width: 30,
                height: 20,
                color: Colors.blue,
              ),
              kWidth,
            ],
            bottom: TabBar(
              unselectedLabelColor: kWhiteColor,
              labelColor: kBlackColor,
              isScrollable: true,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                color: kWhiteColor,
                borderRadius: kRadius30,
              ),
              tabs: const [
                Tab(
                  text: "🍿 Coming Soon",
                ),
                Tab(
                  text: "👀 Everyone's watching",
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const ComingSoonWidget(),
    );
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const EveryonesWatchingWidget(),
    );
  }
}
