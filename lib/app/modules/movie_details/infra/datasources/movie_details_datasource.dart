import 'package:the_movie_db/app/modules/movie_details/infra/models/movie_details_model.dart';

abstract class MovieDetailsDatasourceInterface {
  Future<MovieDetailsModel> fetchMovieDetails({required int id});
}
