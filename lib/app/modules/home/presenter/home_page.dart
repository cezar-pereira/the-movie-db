// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:the_movie_db/app/core/error/failure.dart';
import 'package:the_movie_db/app/modules/home/domain/entities/movie_entity.dart';
import '../domain/entities/movie_genre_entity.dart';
import 'components/list_genres_component.dart';
import 'components/post_film_component.dart';
import 'components/text_field_search_film_component.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    store.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filmes'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 24),
              child: TextFieldSearchFilmComponent(
                value: (value) {},
              ),
            ),
            ValueListenableBuilder(
                valueListenable: store.listGenres,
                builder: (context, List<MovieGenreEntity> value, widget) {
                  return Visibility(
                    visible: value.isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ListGenresComponent(
                        onTap: (value) {
                          store.changeMovieGenre(genreId: value);
                          debugPrint('Genero Selecionado: $value');
                        },
                        genres: store.listGenres.value,
                      ),
                    ),
                  );
                }),
            Expanded(
              child: ScopedBuilder<HomeStore, Failure, List<MovieEntity>>(
                store: store,
                onState: (_, counter) {
                  return NotificationListener<ScrollEndNotification>(
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(top: 24, bottom: 20),
                      shrinkWrap: true,
                      itemCount: store.listMovies.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child:
                              PostFilmComponent(movie: store.listMovies[index]),
                        );
                      },
                      separatorBuilder: (_, __) => SizedBox(height: 16),
                    ),
                    onNotification: (scrollEnd) {
                      if (scrollEnd.metrics.atEdge &&
                          scrollEnd.metrics.pixels > 0) {
                        store.fetchNextPage();
                      }
                      return true;
                    },
                  );
                },
                onLoading: (context) => Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                onError: (context, error) => Center(
                  child: Text(error!.errorMessage,
                      style: TextStyle(color: Colors.red)),
                ),
              ),
            ),
            ValueListenableBuilder(
                valueListenable: store.fetchingMoreMovies,
                builder: (context, bool value, widget) {
                  return Visibility(
                    visible: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text('Loading...'),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
