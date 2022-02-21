import 'package:the_movie_db/app/core/error/failure.dart';

class MovieFailure extends Failure {
  MovieFailure() : super(errorMessage: 'movies-failure-api');
}

class ErrorFetchMovies extends Failure {
  ErrorFetchMovies.empty();
  ErrorFetchMovies(
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
