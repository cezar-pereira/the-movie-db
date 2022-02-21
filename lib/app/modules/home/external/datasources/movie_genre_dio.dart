import 'package:dio/dio.dart';
import 'package:the_movie_db/app/core/api/api.dart';
import 'package:the_movie_db/app/core/error/failure.dart';
import 'package:the_movie_db/app/modules/home/domain/errors/movie_genre_failures.dart';
import 'package:the_movie_db/app/modules/home/infra/datasources/movie_genre_datasource.dart';
import 'package:the_movie_db/app/modules/home/infra/models/movie_genre_model.dart';

class MovieGenreDio implements MovieGenreDatasourceInterface {
  final Dio _dio = Dio(dioOptions);
  String lang = 'pt-BR';
  @override
  Future<List<MovieGenreModel>> fetchMovieGenres() async {
    try {
      var response = await _dio.get('/genre/movie/list?language=$lang');
      final data = response.data['genres'];
      return data
          .map<MovieGenreModel>(
              (films) => MovieGenreModel.fromJson(json: films))
          .toList();
    } on DioError catch (exception, stackTrace) {
      if (exception.type == DioErrorType.response) {
        throw ErrorFetchMovieGenres(stackTrace, 'MovieDio-MovieGenreDio',
            exception, exception.response!.data['status_message']);
      } else {
        throw ConnectionError();
      }
    } on Exception catch (exception, stackTrace) {
      throw ErrorFetchMovieGenres(stackTrace, 'MovieDio-MovieGenreDio',
          exception, exception.toString());
    }
  }
}
