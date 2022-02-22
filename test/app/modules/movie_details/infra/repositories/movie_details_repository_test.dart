import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db/app/modules/home/domain/errors/movie_failures.dart';
import 'package:the_movie_db/app/modules/movie_details/domain/entities/movie_details_entity.dart';
import 'package:the_movie_db/app/modules/movie_details/domain/repositories/movie_details_repository.dart';

class MovieDetailsRepositoryMock extends Mock
    implements MovieDetailsRepositoryInterface {}

class MovieDetailsResponseEntityMock extends Mock
    implements MovieDetailsEntity {}

void main() {
  late final MovieDetailsRepositoryInterface repository;

  setUpAll(() {
    repository = MovieDetailsRepositoryMock();
  });

  test('Should return MovieDetailsEntityMock', () async {
    var entity = MovieDetailsResponseEntityMock();
    when(() => repository.fetchMovieDetails(id: 1))
        .thenAnswer((_) async => Right(entity));
    var result = await repository.fetchMovieDetails(id: 1);
    expect(result, Right(entity));
  });

  test('Should return a Failure', () async {
    var error = ErrorFetchMovies.empty();
    when(() => repository.fetchMovieDetails(id: 1))
        .thenAnswer((_) async => Left(error));
    var result = await repository.fetchMovieDetails(id: 1);
    expect(result, Left(error));
  });
}
