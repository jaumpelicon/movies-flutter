import 'package:flutter_gen/gen_l10n/localization.dart';

import '../models/movies.dart';
import '../support/components/movie_item_components/movie_item_view_model.dart';
import '../support/components/movie_search/movie_search_item_view.dart';
import '../support/components/movie_search/movie_search_item_view_model.dart';
import 'search_movie_view_controller.dart';
import 'useCases/search_movie_use_case.dart';

class SearchMovieViewModel extends SearchMovieProtocol implements MovieItemViewModelDelegate {
  String _errorMessage = '';
  bool _hasError = false;
  bool _isLoading = false;

  final Localization l10n;
  final List<Movie> _searchMovies = [];
  final GetSearchMoviesUseCaseProtocol getSearchMoviesUseCase;

  SearchMovieViewModel({required this.l10n, required this.getSearchMoviesUseCase});

  @override
  String get errorMessage => _errorMessage;

  @override
  bool get hasError => _hasError;

  @override
  bool get isLoading => _isLoading;

  @override
  List<MovieSearchItemViewModelProtocol> get getSearchMoviesViewModels {
    return _searchMovies.map((movie) {
      return MovieSearchItemViewModel(
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
  void getSearchMovies(String query) {
    if (query.isNotEmpty) {
      getSearchMoviesUseCase.execute(
        query: query,
        success: (movies) {
          _hasError = false;
          _searchMovies.clear();
          getSearchMoviesViewModels.clear();
          _searchMovies.addAll(movies);
          _setIsLoading(false);
        },
        failure: (error) {
          _hasError = true;
          _errorMessage = error.description;
          _setIsLoading(false);
        },
      );
    }
  }

  void _setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
