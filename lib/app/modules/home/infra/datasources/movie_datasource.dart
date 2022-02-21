import 'package:the_movie_db/app/modules/home/infra/models/movie_response_model.dart';

abstract class MovieDatasourceInterface {
  Future<MovieResponseModel> fetchMoviesByGenre({int genre = 28, int page = 1});
}
