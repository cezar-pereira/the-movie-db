import 'package:dartz/dartz.dart';
import 'package:the_movie_db/app/core/error/failure.dart';
import 'package:the_movie_db/app/modules/movie_details/domain/entities/movie_details_entity.dart';
import 'package:the_movie_db/app/modules/movie_details/domain/repositories/movie_details_repository.dart';

abstract class FetchMovieDetailsUsecaseInterface {
  Future<Either<Failure, MovieDetailsEntity>> call({required int id});
}

class FetchMovieDetailsUsecase implements FetchMovieDetailsUsecaseInterface {
  final MovieDetailsRepositoryInterface repository;

  FetchMovieDetailsUsecase({required this.repository});
  @override
  Future<Either<Failure, MovieDetailsEntity>> call({required int id}) async {
    return repository.fetchMovieDetails(id: id);
  }
}
