import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/app/modules/home/infra/models/movie_response_model.dart';

void main() {
  test('Should return a MovieResponseModel', () {
    var model = MovieResponseModel.fromJson(json: dataMock);
    expect(model, isA<MovieResponseModel>());
  });
}

Map<String, dynamic> dataMock = {
  "page": 3,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg",
      "genre_ids": [28, 12, 878],
      "id": 634649,
      "original_language": "en",
      "original_title": "Spider-Man: No Way Home",
      "overview":
          "Peter Parker é desmascarado e não consegue mais separar sua vida normal dos grandes riscos de ser um super-herói. Quando ele pede ajuda ao Doutor Estranho, os riscos se tornam ainda mais perigosos, e o forçam a descobrir o que realmente significa ser o Homem-Aranha.",
      "popularity": 9805.303,
      "poster_path": "/fVzXp3NwovUlLe7fvoRynCmBPNc.jpg",
      "release_date": "2021-12-15",
      "title": "Homem-Aranha: Sem Volta Para Casa",
      "video": false,
      "vote_average": 8.3,
      "vote_count": 8089
    }
  ],
  "total_pages": 1581,
  "total_results": 31608
};
