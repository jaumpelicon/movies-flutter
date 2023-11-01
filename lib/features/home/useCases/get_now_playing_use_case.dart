import '../../../api/routes/movies_routes.dart';
import '../../../support/helpers/server_errors.dart';
import '../../models/movies.dart';

typedef Success = void Function(List<Movie> movies);
typedef Failure = void Function(ServerError error);

abstract class GetNowPlayingMoviesUseCaseProtocol {
  void execute({Success? success, Failure? failure});
}

class GetNowPlayingMoviesUseCase extends GetNowPlayingMoviesUseCaseProtocol {
  final MoviesRoutesProtocol routes;

  GetNowPlayingMoviesUseCase({required this.routes});

  @override
  void execute({Success? success, Failure? failure}) {
    routes.getNowPlayingMovies(
      success: (response) {
        try {
          final movies = List<Movie>.from(response['results']?.map((map) => Movie.fromMap(map)));
          success?.call(movies);
        } on Error catch (error) {
          failure?.call(error.internalError());
        }
      },
      failure: (error) {
        failure?.call(error.asServerError());
      },
    );
  }
}
