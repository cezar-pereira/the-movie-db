import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db/app/modules/movie_details/domain/entities/movie_details_entity.dart';
import 'package:the_movie_db/app/modules/movie_details/domain/errors/movie_details_failures.dart';
import 'package:the_movie_db/app/modules/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:the_movie_db/app/modules/movie_details/domain/usecases/fetch_movie_details_usecase.dart';

class MovieDetailsRepositoryMock extends Mock
    implements MovieDetailsRepositoryInterface {}

class MovieDetailsEntityMock extends Mock implements MovieDetailsEntity {}

void main() {
  late final FetchMovieDetailsUsecaseInterface usecase;
  late final MovieDetailsRepositoryInterface repository;

  setUpAll(() {
    repository = MovieDetailsRepositoryMock();
    usecase = FetchMovieDetailsUsecase(repository: repository);
  });

  test('Should return MovieDetailsEntity', () async {
    MovieDetailsEntity list = MovieDetailsEntityMock();
    when(() => repository.fetchMovieDetails(id: 1))
        .thenAnswer((_) async => Right(list));

    var result = await usecase.call(id: 1);
    expect(result, Right(list));
  });

  test('Should return Failure', () async {
    var error = ErrorFetchMovieDetails.empty();
    when(() => repository.fetchMovieDetails(id: 1))
        .thenAnswer((_) async => Left(error));
    var result = await usecase.call(id: 1);
    expect(result, Left(error));
  });
}
