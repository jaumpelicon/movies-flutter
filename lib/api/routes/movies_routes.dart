import '../api_provider.dart';
import '../endpoint.dart';

abstract class MoviesRoutesProtocol {
  void getMostPopularMovies({Success? success, Failure? failure});
  void getTopRatedMovies({Success? success, Failure? failure});
  void getUpComingMovies({Success? success, Failure? failure});
  void getMovieDetails({Success? success, Failure? failure, required int id});
  void getSearchMovies({Success? success, Failure? failure, required String query});
}

class MoviesRoutes extends MoviesRoutesProtocol {
  final ApiProvider _provider = ApiProvider();

  @override
  void getMostPopularMovies({Success? success, Failure? failure}) {
    final endpoint = Endpoint(path: '/movie/popular', method: 'GET');

    _provider.request(success: success, failure: failure, endpoint: endpoint);
  }

  @override
  void getTopRatedMovies({Success? success, Failure? failure}) {
    final endpoint = Endpoint(path: '/movie/top_rated', method: 'GET');
    _provider.request(success: success, failure: failure, endpoint: endpoint);
  }

  @override
  void getSearchMovies({Success? success, Failure? failure, required String query}) {
    final endpoint = Endpoint(path: '/search/movie', method: 'GET');
    endpoint.queryParameters['query'] = query;
    _provider.request(success: success, failure: failure, endpoint: endpoint);
  }

  @override
  void getMovieDetails({Success? success, Failure? failure, required int id}) {
    final endpoint = Endpoint(path: '/movie/$id', method: 'GET');
    _provider.request(success: success, failure: failure, endpoint: endpoint);
  }

  @override
  void getUpComingMovies({Success? success, Failure? failure}) {
    final endpoint = Endpoint(path: '/movie/upcoming', method: 'GET');
    _provider.request(success: success, failure: failure, endpoint: endpoint);
  }
}
