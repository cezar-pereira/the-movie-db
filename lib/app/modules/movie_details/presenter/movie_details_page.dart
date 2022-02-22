import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:the_movie_db/app/core/api/api.dart';
import 'package:the_movie_db/app/core/error/failure.dart';

import 'package:the_movie_db/app/modules/home/domain/entities/movie_entity.dart';
import 'package:the_movie_db/app/modules/movie_details/presenter/movie_details_store.dart';

import 'components/button_backpage_component.dart';
import 'components/card_informations_component.dart';
import 'components/chip_component.dart';
import 'components/chip_transparent_component.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  final MovieEntity movie;

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState
    extends ModularState<MovieDetailsPage, MovieDetailsStore> {
  @override
  void initState() {
    store.fetchMovieDetails(id: widget.movie.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: ButtonBackpageComponent(),
                ),
                const SizedBox(height: 56),
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 56, 76, 0.2),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    height: 318,
                    width: 216,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: CachedNetworkImage(
                          imageUrl: baseUrlImage + widget.movie.posterPath,
                          placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator.adaptive()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ScopedBuilder<MovieDetailsStore, Failure, MovieDetailsState>(
                  store: store,
                  onState: (_, movieDetailsState) {
                    if (movieDetailsState is MovieDetailsInitialState) {
                      return const Text('Error');
                    } else {
                      movieDetailsState as MovieDetailsLoadedState;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: movieDetailsState.movieDetails.voteAverage
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 24, color: Color(0xFF00384C)),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: ' / 10',
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF868E96)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            movieDetailsState.movieDetails.title.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color(0xFF3C3D4A),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 12),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: 'Titulo original: ',
                                style: const TextStyle(
                                    color: Color(0xFF5E6770), fontSize: 10),
                                children: [
                                  TextSpan(
                                    text: movieDetailsState
                                        .movieDetails.originalTitle,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  )
                                ]),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ChipComponent(
                                  label: 'Ano',
                                  value: movieDetailsState
                                      .movieDetails.releaseDate.year
                                      .toString()),
                              const SizedBox(width: 12),
                              ChipComponent(
                                  label: 'Duração',
                                  value: store.formatDuration(
                                      runtime: movieDetailsState
                                          .movieDetails.runtime))
                            ],
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 8,
                            runSpacing: 8,
                            children: movieDetailsState.movieDetails.genres
                                .map((e) =>
                                    ChipTransparentComponent(value: e.name))
                                .toList(),
                          ),
                          const SizedBox(height: 55),
                          CardInformationsComponent(
                            label: 'Descrição',
                            information:
                                movieDetailsState.movieDetails.overview,
                          ),
                          const SizedBox(height: 40),
                          ChipComponent(
                            label: 'ORÇAMENTO',
                            value:
                                '\$ ${movieDetailsState.movieDetails.budget}',
                            expanded: true,
                            labelUpperCase: true,
                          ),
                          const SizedBox(height: 4),
                          const ChipComponent(
                            label: 'PRODUTORAS',
                            value: 'Marvel Studios',
                            expanded: true,
                            labelUpperCase: true,
                          ),
                          const SizedBox(height: 40),
                          CardInformationsComponent(
                            label: 'Diretor',
                            // information: 'Ryan Fleck, Anna Boden',
                            information: movieDetailsState
                                .movieDetails.directors
                                .map((e) => e)
                                .join(', '),
                          ),
                          const SizedBox(height: 32),
                          CardInformationsComponent(
                            label: 'Elenco',
                            information: movieDetailsState.movieDetails.cast
                                .map((e) => e)
                                .join(', '),
                          ),
                        ],
                      );
                    }
                  },
                  onLoading: (context) => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  onError: (context, error) => Center(
                    child: Text(error!.errorMessage,
                        style: const TextStyle(color: Colors.red)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
