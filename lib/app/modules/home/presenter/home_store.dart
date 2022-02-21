// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
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

  ValueNotifier<List<MovieGenreEntity>> listGenres = ValueNotifier([]);
  ValueNotifier<bool> fetchingMoreMovies = ValueNotifier(false);

  List<MovieEntity> listMovies = [];

  int currentPage = 1;
  int currentGenre = 28;

  int totalResults = 0;
  int totalPages = 0;

  Future<void> load() async {
    setLoading(true);
    var response = await Future.wait([
      fetchMovieGenres(),
      fetchMovieByGenre(),
    ]);

    response[0].fold((l) => null, (r) {
      listGenres.value = r as List<MovieGenreEntity>;
    });

    response[1].fold((l) {
      setError(l);
    }, (r) {
      r as MovieResponseEntity;
      totalResults = r.totalResults;
      totalPages = r.totalPages;
      listMovies = [...listMovies, ...mapGenresInMovieList(movies: r.movies)];
      update(listMovies);
    });

    setLoading(false);
  }

  Future<void> fetchNextPage() async {
    if (currentPage < totalPages) {
      fetchingMoreMovies.value = true;
      currentPage++;
      await _fetchMovies();
      fetchingMoreMovies.value = false;
    } else {
      return;
    }
  }

  changeMovieGenre({required int genreId}) async {
    if (genreId == currentGenre) {
      return;
    } else {
      currentGenre = genreId;
      currentPage = 1;
      setLoading(true);

      listMovies.clear();

      await _fetchMovies();
      setLoading(false);
    }
  }

  Future<void> _fetchMovies() async {
    var result =
        await fetchMovieByGenre(genre: currentGenre, page: currentPage);
    result.fold((l) => null, (r) {
      listMovies = [...listMovies, ...mapGenresInMovieList(movies: r.movies)];
      update(listMovies);
    });
  }

  List<MovieEntity> mapGenresInMovieList({required List<MovieEntity> movies}) {
    if (listGenres.value.isEmpty) {
      return movies;
    } else {
      return movies.map((e) {
        e as MovieModel;
        return e.copyWith(genres: listGenres.value);
      }).toList();
    }
  }
}
