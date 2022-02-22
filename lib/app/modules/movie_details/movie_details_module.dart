import 'package:flutter_modular/flutter_modular.dart';
import 'package:the_movie_db/app/modules/movie_details/domain/usecases/fetch_movie_details_usecase.dart';
import 'package:the_movie_db/app/modules/movie_details/external/datasources/movie_details_dio.dart';
import 'package:the_movie_db/app/modules/movie_details/presenter/movie_details_page.dart';

import 'domain/repositories/movie_details_repository.dart';
import 'infra/datasources/movie_datasource.dart';
import 'infra/repositories/movie_details_repository.dart';
import 'presenter/movie_details_store.dart';

class MovieDetailsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) =>
        MovieDetailsStore(usecase: i.get<FetchMovieDetailsUsecaseInterface>())),

    /*** DATASOURCE  ***/
    Bind.lazySingleton((i) => MovieDetailsDio()),

    /*** REPOSITORIES  ***/
    Bind.lazySingleton((i) => MovieDetailsRepository(
        datasource: i.get<MovieDetailsDatasourceInterface>())),

    /*** USECASES  ***/
    Bind.lazySingleton((i) => FetchMovieDetailsUsecase(
        repository: i.get<MovieDetailsRepositoryInterface>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => MovieDetailsPage(movie: args.data)),
  ];
}
