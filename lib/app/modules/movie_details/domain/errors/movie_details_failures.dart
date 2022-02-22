import 'package:the_movie_db/app/core/error/failure.dart';

class MovieDetailsFailure extends Failure {
  MovieDetailsFailure() : super(errorMessage: 'movie-details-failure-api');
}

class ErrorFetchMovieDetails extends Failure {
  ErrorFetchMovieDetails.empty();
  ErrorFetchMovieDetails(
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
