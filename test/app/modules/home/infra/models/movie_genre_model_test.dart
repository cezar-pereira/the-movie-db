import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/app/modules/home/infra/models/movie_genre_model.dart';

void main() {
  test('Should return a MovieGenreModel', () {
    MovieGenreModel model = MovieGenreModel.fromJson(json: dataMock);
    expect(model, isA<MovieGenreModel>());
  });
}

Map<String, dynamic> dataMock = {"id": 1, "name": "Genre"};
