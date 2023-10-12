import 'package:Pelimovies/features/home/useCases/get_top_rated_use_case.dart';
import 'package:Pelimovies/features/models/movies.dart';
import 'package:Pelimovies/support/helpers/server_errors.dart';

class GetTopRatedMoviesUseCaseMock extends GetTopRatedMoviesUseCaseProtocol {
  ServerError? error;
  List<Movie>? movies;

  @override
  void execute({Success? success, Failure? failure}) {
    if (movies != null) {
      return success?.call(movies!);
    }
    if (error != null) {
      return failure?.call(error!);
    }
  }
}
