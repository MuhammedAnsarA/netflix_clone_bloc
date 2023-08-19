import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_bloc/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_bloc/domain/search/i_search_repo.dart';
import 'package:netflix_bloc/domain/search/models/search_respo/search_respo.dart';

import '../../domain/core/api_end_points.dart';

@LazySingleton(as: ISearchRepo)
class SearchRepository implements ISearchRepo {
  @override
  Future<Either<MainFailure, SearchRespo>> searchMovies({
    required String movieQuery,
  }) async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.search, queryParameters: {
        'query': movieQuery,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchRespo.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
