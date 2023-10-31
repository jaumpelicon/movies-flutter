import 'package:flutter_gen/gen_l10n/localization.dart';

import '../favorites/useCases/get_favorite_movies_use_case.dart';
import '../models/movie_details.dart';
import 'movie_details_view_controller.dart';
import 'useCases/add_movie_favorite_use_case.dart';
import 'useCases/get_movie_details_use_case.dart';
import 'useCases/remove_movie_favorite_use_case.dart';

class MovieDetailsViewModel extends MovieDetailsProtocol {
  String _errorMessage = '';
  bool _hasError = false;
  bool _isLoading = false;
  MovieDetail? _movie;

  final _favoritesMovies = List<MovieDetail>.empty(growable: true);

  final Localization l10n;
  final int movieId;
  final GetFavoritesUseCaseProtocol getFavoritesUseCase;
  final GetMovieDetailUseCaseProtocol getMovieDetailUseCase;
  final AddMovieFavoriteUseCaseProtocol addMovieFavoriteUseCase;
  final RemoveMovieFavoriteUseCaseProtocol removeMovieFavoriteUseCase;

  MovieDetailsViewModel({
    required this.movieId,
    required this.l10n,
    required this.getFavoritesUseCase,
    required this.getMovieDetailUseCase,
    required this.addMovieFavoriteUseCase,
    required this.removeMovieFavoriteUseCase,
  });

  @override
  String get errorMessage => _errorMessage;

  @override
  bool get hasError => _hasError;

  @override
  bool get isLoading => _isLoading;

  @override
  bool get isFavorite => _favoritesMovies.any((movie) => movie.id == _movie?.id);

  @override
  MovieDetail? get movieInfos {
    final movie = _movie;

    if (movie == null) {
      return null;
    }

    return movie;
  }

  @override
  void getMovieById() {
    _setIsLoading(true);

    getMovieDetailUseCase.execute(
      movieId: movieId,
      success: (movie) {
        _hasError = false;
        _movie = movie;
        _setIsLoading(false);
      },
      failure: (error) {
        _hasError = true;
        _errorMessage = error.description;
        _setIsLoading(false);
      },
    );

    _updateFavorites();
  }

  void _updateFavorites() {
    _favoritesMovies.clear();
    getFavoritesUseCase.execute(
      success: (movies) {
        _favoritesMovies.addAll(movies);
      },
    );
    notifyListeners();
  }

  @override
  Future<void> onRefresh() {
    return Future.sync(getMovieById);
  }

  void _setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  @override
  Future<void> favoriteMovie() async {
    final movie = _movie;

    if (movie == null) {
      return;
    }

    final isFavoriteMovie = _favoritesMovies.any((movie) => movie.id == _movie?.id);

    if (isFavoriteMovie) {
      removeMovieFavoriteUseCase.execute(
        movie: movie,
        success: (_) {
          _updateFavorites();
        },
      );
    } else {
      addMovieFavoriteUseCase.execute(
        movie: movie,
        success: (_) {
          _updateFavorites();
        },
      );
    }
  }
}
