import 'package:dartz/dartz.dart';
import 'package:the_movie_db/app/core/error/failure.dart';
import 'package:the_movie_db/app/modules/movie_details/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsRepositoryInterface {
  Future<Either<Failure, MovieDetailsEntity>> fetchMovieDetails(
      {required int id});
}
