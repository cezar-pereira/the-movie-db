import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db/app/modules/home/domain/entities/movie_response_entity.dart';
import 'package:the_movie_db/app/modules/home/domain/errors/movie_failures.dart';
import 'package:the_movie_db/app/modules/home/domain/repositories/movie_response_repository.dart';

class MovieRepositoryMock extends Mock implements MovieRepositoryInterface {}

class MovieResponseEntityMock extends Mock implements MovieResponseEntity {}

void main() {
  late final MovieRepositoryInterface repository;

  setUpAll(() {
    repository = MovieRepositoryMock();
  });

  test('Should return MovieResponseEntity', () async {
    var entity = MovieResponseEntityMock();
    when(() => repository.fetchMoviesByGenre())
        .thenAnswer((_) async => Right(entity));
    var result = await repository.fetchMoviesByGenre();
    expect(result, Right(entity));
  });

  test('Should return a Failure', () async {
    var error = ErrorFetchMovies.empty();
    when(() => repository.fetchMoviesByGenre())
        .thenAnswer((_) async => Left(error));
    var result = await repository.fetchMoviesByGenre();
    expect(result, Left(error));
  });
}
