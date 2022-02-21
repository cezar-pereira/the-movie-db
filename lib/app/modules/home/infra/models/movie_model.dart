import 'package:the_movie_db/app/modules/home/domain/entities/movie_entity.dart';

import '../../domain/entities/movie_genre_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required int id,
    required String title,
    String posterPath = '',
    List<int> genreIds = const [],
    List<MovieGenreEntity> genres = const [],
  }) : super(
            id: id,
            title: title,
            posterPath: posterPath,
            genres: genres,
            genreIds: genreIds);

  factory MovieModel.fromJson({required Map<String, dynamic> json}) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'] ?? '',
      genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    );
  }

  MovieModel copyWith({List<MovieGenreEntity>? genres}) {
    return MovieModel(
        id: id,
        title: title,
        genreIds: genreIds,
        posterPath: posterPath,
        genres: genres == null
            ? this.genres
            : genreIds
                .map<MovieGenreEntity>(
                    (e) => genres.firstWhere((element) => element.id == e))
                .toList());
  }
}
