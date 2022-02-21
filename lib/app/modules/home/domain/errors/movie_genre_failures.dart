import 'package:the_movie_db/app/core/error/failure.dart';

class MovieGenresFailure extends Failure {
  MovieGenresFailure() : super(errorMessage: 'movie-genres-failure-api');
}

class ErrorFetchMovieGenres extends Failure {
  ErrorFetchMovieGenres.empty();
  ErrorFetchMovieGenres(
    StackTrace stackTrace,
    String label,
    dynamic exception,
    String errorMessage,
  ) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
          errorMessage: errorMessage,
        );
}
