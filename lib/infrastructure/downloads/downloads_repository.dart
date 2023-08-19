import 'package:injectable/injectable.dart';
import 'package:netflix_bloc/domain/core/api_end_points.dart';
import 'package:netflix_bloc/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_bloc/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_bloc/domain/downloads/models/downloads.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadList = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();

        print(downloadList);
        return Right(downloadList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
