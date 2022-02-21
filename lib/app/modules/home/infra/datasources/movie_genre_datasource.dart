import '../models/movie_genre_model.dart';

abstract class MovieGenreDatasourceInterface {
  Future<List<MovieGenreModel>> fetchMovieGenres();
}
