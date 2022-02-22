import 'package:flutter_triple/flutter_triple.dart';
import 'package:the_movie_db/app/core/error/failure.dart';
import 'package:the_movie_db/app/modules/movie_details/domain/entities/movie_details_entity.dart';
import 'package:the_movie_db/app/modules/movie_details/domain/usecases/fetch_movie_details_usecase.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitialState implements MovieDetailsState {}

class MovieDetailsLoadedState implements MovieDetailsState {
  final MovieDetailsEntity movieDetails;
  MovieDetailsLoadedState({required this.movieDetails});
}

class MovieDetailsStore extends NotifierStore<Failure, MovieDetailsState> {
  MovieDetailsStore({required FetchMovieDetailsUsecaseInterface usecase})
      : _usecase = usecase,
        super(MovieDetailsInitialState());

  final FetchMovieDetailsUsecaseInterface _usecase;

  Future<void> fetchMovieDetails({required int id}) async {
    setLoading(true);

    var result = await _usecase(id: id);

    result.fold((l) {
      setError(l);
    }, (r) {
      update(MovieDetailsLoadedState(movieDetails: r));
    });
    setLoading(false);
  }

  String formatDuration({required int runtime}) {
    var hours = runtime ~/ 60;
    var minuts = runtime % 60;
    return '${hours}h ${minuts}min';
  }
}
