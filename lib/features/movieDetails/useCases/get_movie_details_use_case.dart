import '../../../api/routes/movies_routes.dart';
import '../../models/movie_details.dart';
import '../../../support/helpers/server_errors.dart';

typedef Success = void Function(MovieDetail movie);
typedef Failure = void Function(ServerError error);

abstract class GetMovieDetailUseCaseProtocol {
  void execute({Success? success, Failure? failure, required int movieId});
}

class GetMovieDetailUseCase extends GetMovieDetailUseCaseProtocol {
  final MoviesRoutesProtocol routes;

  GetMovieDetailUseCase({required this.routes});

  @override
  void execute({Success? success, Failure? failure, required int movieId}) {
    routes.getMovieDetails(
      id: movieId,
      success: (response) {
        try {
          final movie = MovieDetail.fromMap(response);
          success?.call(movie);
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
