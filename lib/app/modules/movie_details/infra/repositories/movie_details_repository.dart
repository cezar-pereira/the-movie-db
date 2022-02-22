import 'package:the_movie_db/app/modules/movie_details/domain/entities/movie_details_entity.dart';
import 'package:the_movie_db/app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:the_movie_db/app/modules/movie_details/domain/repositories/movie_details_repository.dart';

import '../datasources/movie_datasource.dart';

class MovieDetailsRepository implements MovieDetailsRepositoryInterface {
  final MovieDetailsDatasourceInterface _datasource;

  MovieDetailsRepository({required MovieDetailsDatasourceInterface datasource})
      : _datasource = datasource;

  @override
  Future<Either<Failure, MovieDetailsEntity>> fetchMovieDetails(
      {required int id}) async {
    try {
      var result = await _datasource.fetchMovieDetails(id: id);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
