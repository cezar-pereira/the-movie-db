import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db/app/modules/home/domain/errors/movie_genre_failures.dart';
import 'package:the_movie_db/app/modules/home/infra/datasources/movie_genre_datasource.dart';
import 'package:the_movie_db/app/modules/home/infra/models/movie_genre_model.dart';

class MovieGenreDataSourceMock extends Mock
    implements MovieGenreDatasourceInterface {}

void main() {
  late final MovieGenreDatasourceInterface dataSource;
  setUpAll(() {
    dataSource = MovieGenreDataSourceMock();
  });

  test('Should return a List<MovieGenreModel>', () async {
    List<MovieGenreModel> list = [];
    when(() => dataSource.fetchMovieGenres()).thenAnswer((_) async => list);
    var result = await dataSource.fetchMovieGenres();
    expect(result, isA<List<MovieGenreModel>>());
  });

  test('Should return a Failure', () async {
    ErrorFetchMovieGenres error = ErrorFetchMovieGenres.empty();
    when(() => dataSource.fetchMovieGenres()).thenThrow(error);
    expect(() async => dataSource.fetchMovieGenres(),
        throwsA(isA<ErrorFetchMovieGenres>()));
  });
}
