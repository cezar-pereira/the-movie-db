import 'package:the_movie_db/app/modules/home/domain/entities/movie_entity.dart';
import 'package:the_movie_db/app/modules/home/domain/entities/movie_response_entity.dart';
import 'package:the_movie_db/app/modules/home/infra/models/movie_model.dart';

class MovieResponseModel extends MovieResponseEntity {
  MovieResponseModel(
      {required int totalResults,
      required int totalPages,
      required List<MovieEntity> movies,
      required int page})
      : super(
            totalResults: totalResults,
            totalPages: totalPages,
            movies: movies,
            page: page);

  factory MovieResponseModel.fromJson({required Map<String, dynamic> json}) {
    return MovieResponseModel(
        page: json['page'],
        totalResults: json['total_results'],
        totalPages: json['total_pages'],
        movies: List<MovieEntity>.from(
            json['results'].map((x) => MovieModel.fromJson(json: x))));
  }
}
