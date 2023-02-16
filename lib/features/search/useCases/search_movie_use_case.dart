import '../../../api/routes/movies_routes.dart';
import '../../models/movies.dart';
import '../../support/helpers/server_errors.dart';

typedef Success = void Function(List<Movie> movies);
typedef Failure = void Function(ServerError error);

abstract class GetSearchMoviesUseCaseProtocol {
  void execute({Success? success, Failure? failure, required String query});
}

class GetSearchMoviesUseCase extends GetSearchMoviesUseCaseProtocol {
  final MoviesRoutesProtocol routes;

  GetSearchMoviesUseCase({required this.routes});

  @override
  void execute({Success? success, Failure? failure, required String query}) {
    routes.getSearchMovies(
      query: query,
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
