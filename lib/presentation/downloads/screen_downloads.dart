import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_bloc/application/downloads/downloads_bloc.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/presentation/widgets/app_bar_widget.dart';

import '../../core/colors.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(title: "Downloads"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => _widgetList[index],
        separatorBuilder: (context, index) => const SizedBox(
          height: 35,
        ),
        itemCount: _widgetList.length,
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadImage());
    });
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          "We will download a personalised selection of\nmovies and shows for you, so there'S\nalways somthing to watch on your\ndevice",
          style: TextStyle(color: Colors.grey, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          radius: size.width * 0.4,
                        ),
                        DownloadsImageWidget(
                          imageList:
                              '$imageAppendUrl${state.downloads[0].posterPath}',
                          margin: const EdgeInsets.only(left: 170, top: 50),
                          angle: 25,
                          size: Size(
                            size.width * 0.37,
                            size.width * 0.5,
                          ),
                        ),
                        DownloadsImageWidget(
                          imageList:
                              '$imageAppendUrl${state.downloads[1].posterPath}',
                          margin: const EdgeInsets.only(right: 170, top: 50),
                          angle: -25,
                          size: Size(
                            size.width * 0.37,
                            size.width * 0.5,
                          ),
                        ),
                        DownloadsImageWidget(
                          imageList:
                              '$imageAppendUrl${state.downloads[2].posterPath}',
                          margin: const EdgeInsets.only(bottom: 40, top: 45),
                          size: Size(
                            size.width * 0.4,
                            size.width * 0.55,
                          ),
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Setup",
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kWhiteColor,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text("Smart Downloads"),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {super.key,
      required this.imageList,
      this.angle = 0,
      required this.margin,
      required this.size});

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                imageList,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
