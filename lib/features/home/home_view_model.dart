import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../support/components/carousel_slider/carousel_item.dart';
import '../../support/components/carousel_slider/carousel_item_view_model.dart';
import '../../support/components/movie_item_components/movie_item.dart';
import '../../support/components/movie_item_components/movie_item_view_model.dart';
import '../models/movies.dart';
import 'home_view_controler.dart';
import 'useCases/get_most_popular_use_case.dart';
import 'useCases/get_top_rated_use_case.dart';
import 'useCases/get_up_coming_use_case.dart';

class HomeViewModel extends HomeProtocol implements MovieItemViewModelDelegate {
  String _errorMessage = '';
  bool _hasError = false;
  bool _isLoading = false;

  final Localization l10n;
  final _topRatedMovies = List<Movie>.empty(growable: true);
  final _mostPopularMovies = List<Movie>.empty(growable: true);
  final _upComingMovies = List<Movie>.empty(growable: true);

  final GetUpComingMoviesUseCaseProtocol getUpComingMoviesUseCase;
  final GetTopRatedMoviesUseCaseProtocol getTopRatedMoviesUseCase;
  final GetMostPopularMoviesUseCaseProtocol getMostPopularMoviesUseCase;

  HomeViewModel({
    required this.l10n,
    required this.getUpComingMoviesUseCase,
    required this.getTopRatedMoviesUseCase,
    required this.getMostPopularMoviesUseCase,
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
  List<MovieItemViewModelProtocol> get upComingMoviesViewModels {
    return _upComingMovies.map((movie) {
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
  void loadContent() {
    onRefresh();
  }

  @override
  Future<void> onRefresh() {
    return Future.sync(() {
      _getTopRatedMovies();
      _getUpComingMovies();
      _getMostPopularMovies();
    });
  }

  @override
  void didTapMovie({required int movieId}) {
    onTapMovie?.call(movieId);
  }

  void _getMostPopularMovies() {
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

  void _getTopRatedMovies() {
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

  void _getUpComingMovies() {
    _setIsLoading(true);

    getUpComingMoviesUseCase.execute(
      success: (movies) {
        _hasError = false;
        _upComingMovies.addAll(movies);
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
}
