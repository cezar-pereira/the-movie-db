import 'package:the_movie_db/app/modules/movie_details/domain/entities/movie_details_entity.dart';
import 'package:the_movie_db/app/modules/movie_details/domain/entities/production_company_entity.dart';
import 'package:the_movie_db/app/modules/movie_details/infra/models/production_company_model.dart';
import 'package:the_movie_db/app/modules/home/domain/entities/movie_genre_entity.dart';
import 'package:the_movie_db/app/modules/home/infra/models/movie_genre_model.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  MovieDetailsModel({
    required int id,
    required String title,
    required List<MovieGenreEntity> genres,
    required String posterPath,
    required int budget,
    required String originalTitle,
    required String overview,
    required DateTime releaseDate,
    required int runtime,
    required double voteAverage,
    required List<ProductionCompanyEntity> companies,
    List<String> directors = const [],
    List<String> cast = const [],
  }) : super(
            id: id,
            title: title,
            genres: genres,
            posterPath: posterPath,
            budget: budget,
            originalTitle: originalTitle,
            overview: overview,
            releaseDate: releaseDate,
            runtime: runtime,
            voteAverage: voteAverage,
            companies: companies,
            directors: directors,
            cast: cast);

  factory MovieDetailsModel.fromJson({required Map<String, dynamic> json}) {
    getDirectors({required List crew}) {
      crew.retainWhere((e) => e['job'] == 'Director');
      return crew.map<String>((e) => e['original_name']).toList();
    }

    getCast({required List cast}) {
      return cast.map<String>((e) => e['original_name']).toList();
    }

    return MovieDetailsModel(
        id: json['id'],
        title: json['title'],
        genres: List<MovieGenreEntity>.from(
            json['genres'].map((e) => MovieGenreModel.fromJson(json: e))),
        posterPath: json['poster_path'],
        budget: json['budget'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        releaseDate: DateTime.parse(json['release_date']),
        runtime: json['runtime'],
        voteAverage: json['vote_average'],
        companies: List<ProductionCompanyEntity>.from(
            json['production_companies']
                .map((e) => ProductionCompanyModel.fromJson(json: e))),
        directors: getDirectors(crew: json['credits']['crew']),
        cast: getCast(cast: json['credits']['cast']));
  }
}
