import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/presentation/search/widgets/title.dart';

import '../../../application/search/search_bloc.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: "Movies & TV"),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1 / 1.4,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: List.generate(
                  20,
                  (index) {
                    final movie = state.searchResultList[index];
                    return MainCardd(
                      imageUrl: movie.posterImageUrl,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class MainCardd extends StatelessWidget {
  final String imageUrl;
  const MainCardd({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          ),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
