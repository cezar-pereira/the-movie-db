import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/app/modules/movie_details/infra/models/production_company_model.dart';

void main() {
  test('Should return a ProductionCompanyEntity', () {
    var model = ProductionCompanyModel.fromJson(json: dataMock);
    expect(model, isA<ProductionCompanyModel>());
  });
}

Map<String, dynamic> dataMock = {
  "id": 420,
  "logo_path": "/hUzeosd33nzE5MCNsZxCGEKTXaQ.png",
  "name": "Marvel Studios",
  "origin_country": "US"
};
