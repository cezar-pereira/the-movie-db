import 'package:dartz/dartz.dart';
import 'package:the_movie_db/app/core/error/failure.dart';
import 'package:the_movie_db/app/modules/home/domain/entities/movie_response_entity.dart';
import '../repositories/movie_response_repository.dart';

abstract class FetchMoviesByGenreUsecaseInterface {
  Future<Either<Failure, MovieResponseEntity>> call();
}

class FetchMoviesByGenreUsecase implements FetchMoviesByGenreUsecaseInterface {
  final MovieRepositoryInterface repository;

  FetchMoviesByGenreUsecase({required this.repository});
  @override
  Future<Either<Failure, MovieResponseEntity>> call() async {
    return repository.fetchMoviesByGenre();
  }
}
