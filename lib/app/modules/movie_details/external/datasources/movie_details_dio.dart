import 'package:dio/dio.dart';
import 'package:the_movie_db/app/core/api/api.dart';
import 'package:the_movie_db/app/core/error/failure.dart';
import 'package:the_movie_db/app/modules/movie_details/domain/errors/movie_details_failures.dart';
import 'package:the_movie_db/app/modules/movie_details/infra/datasources/movie_details_datasource.dart';
import 'package:the_movie_db/app/modules/movie_details/infra/models/movie_details_model.dart';

class MovieDetailsDio implements MovieDetailsDatasourceInterface {
  final Dio _dio = Dio(dioOptions);
  final String lang = 'pt-BR';

  @override
  Future<MovieDetailsModel> fetchMovieDetails({required int id}) async {
    try {
      var response = await _dio
          .get('/movie/$id?&language=$lang&append_to_response=credits');
      return MovieDetailsModel.fromJson(json: response.data);
    } on DioError catch (exception, stackTrace) {
      if (exception.type == DioErrorType.response) {
        throw ErrorFetchMovieDetails(
            stackTrace,
            'MovieDetailsDio-fetchMovieDetails',
            exception,
            exception.response!.data['status_message']);
      } else {
        throw ConnectionError();
      }
    } on Exception catch (exception, stackTrace) {
      throw ErrorFetchMovieDetails(stackTrace,
          'MovieDetailsDio-fetchMovieDetails', exception, exception.toString());
    }
  }
}
