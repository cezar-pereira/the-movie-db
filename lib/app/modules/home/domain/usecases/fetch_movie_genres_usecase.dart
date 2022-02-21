import 'package:dartz/dartz.dart';
import 'package:the_movie_db/app/core/error/failure.dart';
import 'package:the_movie_db/app/modules/home/domain/entities/movie_genre_entity.dart';

import '../repositories/movie_genre_repository.dart';

abstract class FetchMovieGenresUsecaseInterface {
  Future<Either<Failure, List<MovieGenreEntity>>> call();
}

class FetchMovieGenresUsecase implements FetchMovieGenresUsecaseInterface {
  final MovieGenreRepositoryInterface repository;

  FetchMovieGenresUsecase({required this.repository});
  @override
  Future<Either<Failure, List<MovieGenreEntity>>> call() async {
    return repository.fetchMovieGenres();
  }
}
