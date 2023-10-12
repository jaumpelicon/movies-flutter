import 'package:Pelimovies/features/home/useCases/get_most_popular_use_case.dart';
import 'package:Pelimovies/features/models/movies.dart';
import 'package:Pelimovies/support/helpers/server_errors.dart';

class GetMostPopularUseCaseMock extends GetMostPopularMoviesUseCaseProtocol {
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
