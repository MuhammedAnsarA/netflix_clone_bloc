import 'package:dartz/dartz.dart';
import 'package:netflix_bloc/domain/core/failures/main_failure.dart';
import 'package:netflix_bloc/domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
