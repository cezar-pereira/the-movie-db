import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/app/modules/home/infra/models/movie_model.dart';
import 'package:the_movie_db/app/modules/movie_details/infra/models/movie_details_model.dart';

void main() {
  test('Should return a MovieDetailsModel', () {
    var model = MovieDetailsModel.fromJson(json: dataMock);
    expect(model, isA<MovieDetailsModel>());
  });

  test('should return an empty poster_path if it is null', () {
    var data = dataMock;
    data['poster_path'] = null;
    var model = MovieModel.fromJson(json: data);
    expect(model.posterPath.isEmpty, true);
  });
}

Map<String, dynamic> dataMock = {
  "adult": false,
  "backdrop_path": "/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg",
  "genre_ids": [28, 12, 878],
  "id": 634649,
  "budget": 200000000,
  "runtime": 148,
  "vote_average": 8.3,
  "original_language": "en",
  "original_title": "Spider-Man: No Way Home",
  "genres": [
    {"id": 28, "name": "Ação"},
    {"id": 12, "name": "Aventura"},
    {"id": 878, "name": "Ficção científica"}
  ],
  "overview":
      "Peter Parker é desmascarado e não consegue mais separar sua vida normal dos grandes riscos de ser um super-herói. Quando ele pede ajuda ao Doutor Estranho, os riscos se tornam ainda mais perigosos, e o forçam a descobrir o que realmente significa ser o Homem-Aranha.",
  "popularity": 9805.303,
  "poster_path": "/fVzXp3NwovUlLe7fvoRynCmBPNc.jpg",
  "release_date": "2021-12-15",
  "title": "Homem-Aranha: Sem Volta Para Casa",
  "video": false,
  "vote_count": 8089,
  "credits": {"cast": [], "crew": []},
  "production_companies": [
    {
      "id": 420,
      "logo_path": "/hUzeosd33nzE5MCNsZxCGEKTXaQ.png",
      "name": "Marvel Studios",
      "origin_country": "US"
    },
  ]
};
