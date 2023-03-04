import '../../../api/routes/movies_routes.dart';
import '../../../support/helpers/server_errors.dart';
import '../../models/movies.dart';

typedef Success = void Function(List<Movie> movies);
typedef Failure = void Function(ServerError error);

abstract class GetTopRatedMoviesUseCaseProtocol {
  void execute({Success? success, Failure? failure});
}

class GetTopRatedMoviesUseCase extends GetTopRatedMoviesUseCaseProtocol {
  final MoviesRoutesProtocol routes;

  GetTopRatedMoviesUseCase({required this.routes});

  @override
  void execute({Success? success, Failure? failure}) {
    routes.getTopRatedMovies(
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
