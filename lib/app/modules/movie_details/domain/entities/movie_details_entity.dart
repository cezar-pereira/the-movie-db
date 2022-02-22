import 'package:the_movie_db/app/modules/movie_details/domain/entities/production_company_entity.dart';
import 'package:the_movie_db/app/modules/home/domain/entities/movie_genre_entity.dart';

class MovieDetailsEntity {
  final int id;
  final String title;
  final String posterPath;
  final int budget;
  final String originalTitle;
  final String overview;
  final DateTime releaseDate;
  final int runtime;
  final double voteAverage;
  final List<MovieGenreEntity> genres;
  final List<ProductionCompanyEntity> companies;
  final List<String> directors;
  final List<String> cast;

  MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.genres,
    required this.posterPath,
    required this.budget,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.companies,
    this.directors = const [],
    this.cast = const [],
  });
}
