import 'package:dartz/dartz.dart';
import 'package:the_movie_db/app/core/error/failure.dart';
import 'package:the_movie_db/app/modules/home/domain/entities/movie_genre_entity.dart';

abstract class MovieGenreRepositoryInterface {
  Future<Either<Failure, List<MovieGenreEntity>>> fetchMovieGenres();
}
