import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db/app/modules/home/domain/entities/movie_genre_entity.dart';
import 'package:the_movie_db/app/modules/home/domain/errors/movie_genre_failures.dart';
import 'package:the_movie_db/app/modules/home/domain/repositories/movie_genre_repository.dart';
import 'package:the_movie_db/app/modules/home/domain/usecases/fetch_movie_genres_usecase.dart';

class MovieGenreRepositoryMock extends Mock
    implements MovieGenreRepositoryInterface {}

void main() {
  late final FetchMovieGenresUsecaseInterface usecase;
  late final MovieGenreRepositoryInterface repository;

  setUpAll(() {
    repository = MovieGenreRepositoryMock();
    usecase = FetchMovieGenresUsecase(repository: repository);
  });

  test('Should return List<MovieGenreEntity>', () async {
    List<MovieGenreEntity> list = [];
    when(() => repository.fetchMovieGenres())
        .thenAnswer((_) async => Right(list));

    var result = await usecase.call();
    expect(result, Right(list));
  });

  test('Should return Failure', () async {
    var error = ErrorFetchMovieGenres.empty();
    when(() => repository.fetchMovieGenres())
        .thenAnswer((_) async => Left(error));
    var result = await usecase.call();
    expect(result, Left(error));
  });
}
