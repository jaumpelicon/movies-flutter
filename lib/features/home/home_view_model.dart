import 'package:flutter_gen/gen_l10n/localization.dart';

import '../models/movies.dart';
import '../../support/components/carousel_slider/carousel_item.dart';
import '../../support/components/carousel_slider/carousel_item_view_model.dart';
import '../../support/components/movie_item_components/movie_item.dart';
import '../../support/components/movie_item_components/movie_item_view_model.dart';
import 'home_view_controler.dart';
import 'useCases/get_most_popular_use_case.dart';
import 'useCases/get_top_rated_use_case.dart';

class HomeViewModel extends HomeProtocol implements MovieItemViewModelDelegate {
  String _errorMessage = '';
  bool _hasError = false;
  bool _isLoading = false;

  final Localization l10n;
  final List<Movie> _topRatedMovies = [];
  final List<Movie> _mostPopularMovies = [];
  final GetMostPopularMoviesUseCaseProtocol getMostPopularMoviesUseCase;
  final GetTopRatedMoviesUseCaseProtocol getTopRatedMoviesUseCase;

  HomeViewModel({
    required this.l10n,
    required this.getMostPopularMoviesUseCase,
    required this.getTopRatedMoviesUseCase,
  });

  @override
  String get errorMessage => _errorMessage;

  @override
  bool get hasError => _hasError;

  @override
  bool get isLoading => _isLoading;

  //TODO CREATE PAGINATION
  @override
  List<MovieItemViewModelProtocol> get topRatedMoviesViewModels {
    return _topRatedMovies.map((movie) {
      return MovieItemViewModel(
        l10n: l10n,
        movie: movie,
        showRate: true,
        delegate: this,
      );
    }).toList();
  }

  @override
  List<CarouselMovieItemViewModelProtocol> get mostPopularMoviesCarouselViewModels {
    if (_mostPopularMovies.length < 3) {
      return [];
    }
    return _mostPopularMovies.getRange(0, 3).map((movie) {
      return CarouselMovieItemViewModel(
        l10n: l10n,
        movie: movie,
        showRate: true,
        delegate: this,
      );
    }).toList();
  }

  @override
  void didTapMovie({required int movieId}) {
    onTapMovie?.call(movieId);
  }

  @override
  void getMostPopularMovies() {
    _setIsLoading(true);

    getMostPopularMoviesUseCase.execute(
      success: (movies) {
        _hasError = false;
        _mostPopularMovies.addAll(movies);
        _setIsLoading(false);
      },
      failure: (error) {
        _hasError = true;
        _errorMessage = error.description;
        _setIsLoading(false);
      },
    );
  }

  @override
  void getTopRatedMovies() {
    _setIsLoading(true);

    getTopRatedMoviesUseCase.execute(
      success: (movies) {
        _hasError = false;
        _topRatedMovies.addAll(movies);
        _setIsLoading(false);
      },
      failure: (error) {
        _hasError = true;
        _errorMessage = error.description;
        _setIsLoading(false);
      },
    );
  }

  void _setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  @override
  Future<void> onRefresh() {
    getTopRatedMovies();
    return Future.sync(() => getMostPopularMovies());
  }
}
