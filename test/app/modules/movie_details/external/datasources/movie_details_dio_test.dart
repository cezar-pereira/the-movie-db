import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db/app/modules/home/domain/errors/movie_failures.dart';
import 'package:the_movie_db/app/modules/movie_details/infra/datasources/movie_details_datasource.dart';
import 'package:the_movie_db/app/modules/movie_details/infra/models/movie_details_model.dart';

class MovieDetailsDatasourceMock extends Mock
    implements MovieDetailsDatasourceInterface {}

class MovieDetailsModelMock extends Mock implements MovieDetailsModel {}

void main() {
  late final MovieDetailsDatasourceInterface dataSource;
  setUpAll(() {
    dataSource = MovieDetailsDatasourceMock();
  });

  test('Should return a MovieDetailsModel', () async {
    var model = MovieDetailsModelMock();
    when(() => dataSource.fetchMovieDetails(id: 1))
        .thenAnswer((_) async => model);
    var result = await dataSource.fetchMovieDetails(id: 1);
    expect(result, isA<MovieDetailsModel>());
  });

  test('Should return a Failure', () async {
    ErrorFetchMovies error = ErrorFetchMovies.empty();
    when(() => dataSource.fetchMovieDetails(id: 1)).thenThrow(error);
    expect(() async => dataSource.fetchMovieDetails(id: 1),
        throwsA(isA<ErrorFetchMovies>()));
  });
}
