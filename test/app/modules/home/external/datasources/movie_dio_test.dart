import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db/app/modules/home/domain/errors/movie_failures.dart';
import 'package:the_movie_db/app/modules/home/infra/datasources/movie_datasource.dart';
import 'package:the_movie_db/app/modules/home/infra/models/movie_response_model.dart';

class MovieDatasourceMock extends Mock implements MovieDatasourceInterface {}

class MovieResponseEntityMock extends Mock implements MovieResponseModel {}

void main() {
  late final MovieDatasourceInterface dataSource;
  setUpAll(() {
    dataSource = MovieDatasourceMock();
  });

  test('Should return a MovieResponseModel', () async {
    var model = MovieResponseEntityMock();
    when(() => dataSource.fetchMoviesByGenre()).thenAnswer((_) async => model);
    var result = await dataSource.fetchMoviesByGenre();
    expect(result, isA<MovieResponseModel>());
  });

  test('Should return a Failure', () async {
    ErrorFetchMovies error = ErrorFetchMovies.empty();
    when(() => dataSource.fetchMoviesByGenre()).thenThrow(error);
    expect(() async => dataSource.fetchMoviesByGenre(),
        throwsA(isA<ErrorFetchMovies>()));
  });
}
