import 'package:dartz/dartz.dart';
import 'package:the_movie_db/app/modules/home/domain/entities/movie_response_entity.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/movie_response_repository.dart';
import '../datasources/movie_datasource.dart';

class MovieRepository implements MovieRepositoryInterface {
  final MovieDatasourceInterface _datasource;

  MovieRepository({required MovieDatasourceInterface datasource})
      : _datasource = datasource;

  @override
  Future<Either<Failure, MovieResponseEntity>> fetchMoviesByGenre(
      {int genre = 28, int page = 1}) async {
    try {
      var result =
          await _datasource.fetchMoviesByGenre(genre: genre, page: page);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
