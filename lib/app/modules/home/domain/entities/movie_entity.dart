import 'package:the_movie_db/app/modules/home/domain/entities/movie_genre_entity.dart';

class MovieEntity {
  final String posterPath;
  final int id;
  final String title;
  final List<int> genreIds;
  final List<MovieGenreEntity> genres;

  MovieEntity({
    required this.id,
    required this.title,
    this.posterPath = '',
    this.genreIds = const [],
    this.genres = const [],
  });

  @override
  String toString() => title;
}
