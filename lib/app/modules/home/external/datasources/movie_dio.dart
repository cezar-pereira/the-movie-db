import 'package:dio/dio.dart';
import 'package:the_movie_db/app/core/api/api.dart';
import 'package:the_movie_db/app/core/error/failure.dart';
import 'package:the_movie_db/app/modules/home/domain/errors/movie_failures.dart';
import 'package:the_movie_db/app/modules/home/infra/datasources/movie_datasource.dart';

import 'package:the_movie_db/app/modules/home/infra/models/movie_response_model.dart';

class MovieDio implements MovieDatasourceInterface {
  final Dio _dio = Dio(dioOptions);
  final String lang = 'pt-BR';
  @override
  Future<MovieResponseModel> fetchMoviesByGenre(
      {int genre = 28, int page = 1}) async {
    try {
      //tratativa, pois a API só responde até a page 500
      page > 500 ? 500 : page;
      var response = await _dio
          .get('/discover/movie?language=$lang&with_genres=$genre&page=$page');
      return MovieResponseModel.fromJson(json: response.data);
    } on DioError catch (exception, stackTrace) {
      if (exception.type == DioErrorType.response) {
        throw ErrorFetchMovies(stackTrace, 'MovieDio-fetchMoviesByGenre',
            exception, exception.response!.data['status_message']);
      } else {
        throw ConnectionError();
      }
    } on Exception catch (exception, stackTrace) {
      throw ErrorFetchMovies(stackTrace, 'MovieDio-fetchMoviesByGenre',
          exception, exception.toString());
    }
  }
}
