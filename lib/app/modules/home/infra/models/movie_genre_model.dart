import 'package:the_movie_db/app/modules/home/domain/entities/movie_genre_entity.dart';

class MovieGenreModel extends MovieGenreEntity {
  MovieGenreModel({required int id, required String name})
      : super(id: id, name: name);

  factory MovieGenreModel.fromJson({required Map<String, dynamic> json}) {
    return MovieGenreModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
