import 'package:the_movie_db/app/modules/home/domain/entities/movie_genre_entity.dart';
import 'package:the_movie_db/app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:the_movie_db/app/modules/home/domain/repositories/movie_genre_repository.dart';
import 'package:the_movie_db/app/modules/home/infra/datasources/movie_genre_datasource.dart';

class MovieGenreRepository implements MovieGenreRepositoryInterface {
  final MovieGenreDatasourceInterface _datasource;

  MovieGenreRepository({required MovieGenreDatasourceInterface datasource})
      : _datasource = datasource;

  @override
  Future<Either<Failure, List<MovieGenreEntity>>> fetchMovieGenres() async {
    try {
      var result = await _datasource.fetchMovieGenres();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
