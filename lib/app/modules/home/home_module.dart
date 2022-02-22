import 'package:flutter_modular/flutter_modular.dart';
import 'package:the_movie_db/app/modules/movie_details/movie_details_module.dart';
import 'package:the_movie_db/app/modules/home/domain/usecases/fetch_movie_genres_usecase.dart';
import 'package:the_movie_db/app/modules/home/domain/usecases/fetch_movies_by_genre_usecase.dart';
import 'package:the_movie_db/app/modules/home/infra/datasources/movie_datasource.dart';
import 'package:the_movie_db/app/modules/home/infra/repositories/movie_genre_repository.dart';
import 'package:the_movie_db/app/modules/home/infra/repositories/movie_repository.dart';

import 'domain/repositories/movie_genre_repository.dart';
import 'domain/repositories/movie_response_repository.dart';
import 'external/datasources/movie_dio.dart';
import 'external/datasources/movie_genre_dio.dart';
import 'infra/datasources/movie_genre_datasource.dart';
import 'presenter/home_page.dart';
import 'presenter/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(
        fetchMovieByGenre: i.get<FetchMoviesByGenreUsecaseInterface>(),
        fetchMovieGenres: i.get<FetchMovieGenresUsecaseInterface>())),

    /*** DATASOURCE  ***/
    Bind.lazySingleton((i) => MovieDio()),
    Bind.lazySingleton((i) => MovieGenreDio()),

    /*** REPOSITORIES  ***/
    Bind.lazySingleton(
        (i) => MovieRepository(datasource: i.get<MovieDatasourceInterface>())),
    Bind.lazySingleton((i) => MovieGenreRepository(
        datasource: i.get<MovieGenreDatasourceInterface>())),

    /*** USECASES  ***/
    Bind.lazySingleton((i) => FetchMoviesByGenreUsecase(
        repository: i.get<MovieRepositoryInterface>())),
    Bind.lazySingleton((i) => FetchMovieGenresUsecase(
        repository: i.get<MovieGenreRepositoryInterface>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ModuleRoute('/movie-details', module: MovieDetailsModule())
  ];
}
