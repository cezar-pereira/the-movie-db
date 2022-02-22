import 'package:the_movie_db/app/modules/movie_details/domain/entities/production_company_entity.dart';

class ProductionCompanyModel extends ProductionCompanyEntity {
  ProductionCompanyModel(
      {required int id,
      required String logoPath,
      required String name,
      required String originCountry})
      : super(
          id: id,
          logoPath: logoPath,
          name: name,
          originCountry: originCountry,
        );

  factory ProductionCompanyModel.fromJson(
          {required Map<String, dynamic> json}) =>
      ProductionCompanyModel(
        id: json["id"],
        logoPath: json["logo_path"] ?? '',
        name: json["name"],
        originCountry: json["origin_country"],
      );
}
