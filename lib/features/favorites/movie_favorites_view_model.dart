import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../support/components/movie_favorites/movie_favorite_item.dart';
import '../../support/components/movie_favorites/movie_favorite_item_view_model.dart';
import '../models/movie_details.dart';
import 'movie_favorites_controller.dart';
import 'useCases/get_favorite_movies_use_case.dart';

class MovieFavoritesViewModel extends MovieFavoritesProtocol implements MovieItemViewModelDelegate {
  String _errorMessage = '';
  bool _hasError = false;
  bool _isLoading = false;
  final List<MovieDetail> _movies = [];

  final Localization l10n;
  final GetFavoritesUseCaseProtocol getFavoritesMoviesUseCase;

  MovieFavoritesViewModel({
    required this.l10n,
    required this.getFavoritesMoviesUseCase,
  });

  @override
  String get errorMessage => _errorMessage;

  @override
  //TODO Implemented error screen
  bool get hasError => _hasError;

  @override
  bool get isLoading => _isLoading;

  @override
  List<MovieFavoriteItemViewModelProtocol> get favoritesMovies {
    return _movies.map((movie) {
      return MovieFavoriteItemViewModel(
        l10n: l10n,
        movie: movie,
        showRate: true,
        delegate: this,
      );
    }).toList();
  }

  @override
  void getFavoritesMovies() {
    _setIsLoading(true);
    _movies.clear();
    getFavoritesMoviesUseCase.execute(
      success: (movies) {
        _hasError = false;
        _movies.addAll(movies);
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
  Future<void> onRefresh() async {
    return getFavoritesMovies();
  }

  @override
  void didTapMovie({required int movieId}) {
    onTapMovie?.call(movieId);
  }
}
