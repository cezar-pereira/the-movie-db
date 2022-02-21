import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db/app/modules/home/domain/entities/movie_response_entity.dart';
import 'package:the_movie_db/app/modules/home/domain/errors/movie_failures.dart';
import 'package:the_movie_db/app/modules/home/domain/repositories/movie_response_repository.dart';
import 'package:the_movie_db/app/modules/home/domain/usecases/fetch_movies_by_genre_usecase.dart';

class MovieRepositoryMock extends Mock implements MovieRepositoryInterface {}

class MovieResponseEntityMock extends Mock implements MovieResponseEntity {}

void main() {
  late final FetchMoviesByGenreUsecaseInterface usecase;
  late final MovieRepositoryInterface repository;

  setUpAll(() {
    repository = MovieRepositoryMock();
    usecase = FetchMoviesByGenreUsecase(repository: repository);
  });

  test('Should return MovieResponseEntity', () async {
    var entity = MovieResponseEntityMock();
    when(() => repository.fetchMoviesByGenre())
        .thenAnswer((_) async => Right(entity));
    var result = await usecase.call();
    expect(result, Right(entity));
  });

  test('Should return Failure', () async {
    var error = ErrorFetchMovies.empty();
    when(() => repository.fetchMoviesByGenre())
        .thenAnswer((_) async => Left(error));
    var result = await usecase.call();
    expect(result, Left(error));
  });
}
