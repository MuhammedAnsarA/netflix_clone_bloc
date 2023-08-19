import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_bloc/domain/core/failures/main_failure.dart';
import 'package:netflix_bloc/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_bloc/domain/search/i_search_repo.dart';

import '../../domain/downloads/models/downloads.dart';
import '../../domain/search/models/search_respo/search_respo.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final ISearchRepo _searchService;

  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
    /*
    idle state
    */
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
          searchResultList: [],
          idleList: state.idleList,
          isLoading: false,
          isError: false,
        ));
        return;
      }
      // get trending
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
      final _result = await _downloadsService.getDownloadsImages();
      final _state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false);
      });
      emit(_state);
      // show to ui
    });

    /*
    search state
    */
    on<SearchMovie>((event, emit) async {
      log("Searching for ${event.movieQuery}");
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
      // call search movie api
      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (SearchRespo r) {
        return SearchState(
            searchResultList: r.results,
            idleList: [],
            isLoading: false,
            isError: false);
      });
      // show to ui
      emit(_state);
    });
  }
}
