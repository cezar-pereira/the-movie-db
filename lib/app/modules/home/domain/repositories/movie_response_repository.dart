import 'package:dartz/dartz.dart';
import 'package:the_movie_db/app/core/error/failure.dart';
import 'package:the_movie_db/app/modules/home/domain/entities/movie_response_entity.dart';

abstract class MovieRepositoryInterface {
  Future<Either<Failure, MovieResponseEntity>> fetchMoviesByGenre(
      {int genre = 28, int page = 1});
}
