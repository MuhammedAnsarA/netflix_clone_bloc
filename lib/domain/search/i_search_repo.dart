import 'package:dartz/dartz.dart';
import 'package:netflix_bloc/domain/core/failures/main_failure.dart';
import 'package:netflix_bloc/domain/search/models/search_respo/search_respo.dart';

abstract class ISearchRepo {
  Future<Either<MainFailure, SearchRespo>> searchMovies({
    required String movieQuery,
  });
}
