import 'package:the_movie_db/app/modules/home/domain/entities/movie_entity.dart';

class MovieResponseEntity {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<MovieEntity> movies;

  MovieResponseEntity({
    required this.totalResults,
    required this.totalPages,
    required this.movies,
    required this.page,
  });
}
