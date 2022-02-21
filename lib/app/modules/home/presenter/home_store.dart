// ignore_for_file: must_be_immutable

import 'package:flutter_triple/flutter_triple.dart';
import 'package:the_movie_db/app/core/error/failure.dart';
import 'package:the_movie_db/app/modules/home/domain/entities/movie_entity.dart';
import 'package:the_movie_db/app/modules/home/domain/entities/movie_genre_entity.dart';
import 'package:the_movie_db/app/modules/home/domain/entities/movie_response_entity.dart';
import 'package:the_movie_db/app/modules/home/infra/models/movie_model.dart';

import '../domain/usecases/fetch_movie_genres_usecase.dart';
import '../domain/usecases/fetch_movies_by_genre_usecase.dart';

class HomeStore extends NotifierStore<Failure, List<MovieEntity>> {
  HomeStore({required this.fetchMovieByGenre, required this.fetchMovieGenres})
      : super([]);

  final FetchMoviesByGenreUsecaseInterface fetchMovieByGenre;
  final FetchMovieGenresUsecaseInterface fetchMovieGenres;

  List<MovieGenreEntity> listGenres = [];
  List<MovieEntity> listMovies = [];

  Future<void> load() async {
    setLoading(true);
    var response = await Future.wait([
      fetchMovieGenres(),
      fetchMovieByGenre(),
    ]);

    response[0].fold((l) => null, (r) {
      listGenres = r as List<MovieGenreEntity>;
    });

    response[1].fold((l) {
      setError(l);
    }, (r) {
      r as MovieResponseEntity;
      listMovies = r.movies;
      listMovies = mapGenresInMovieList();
      update(listMovies);
    });

    setLoading(false);
  }

  List<MovieEntity> mapGenresInMovieList() {
    if (listGenres.isEmpty) {
      return listMovies;
    } else {
      return listMovies.map((e) {
        e as MovieModel;
        return e.copyWith(genres: listGenres);
      }).toList();
    }
  }
}
