import 'package:flutter_gen/gen_l10n/localization.dart';

import '../models/movie_details.dart';
import 'movie_details_view_controller.dart';
import 'useCases/add_movie_favorite_use_case.dart';
import 'useCases/get_movie_details_use_case.dart';

class MovieDetailsViewModel extends MovieDetailsProtocol {
  String _errorMessage = '';
  bool _hasError = false;
  bool _isLoading = false;
  MovieDetail? _movie;

  final Localization l10n;
  final int movieId;
  final GetMovieDetailUseCaseProtocol getMovieDetailUseCase;
  final AddMovieFavoriteUseCaseProtocol addMovieFavoriteUseCase;

  MovieDetailsViewModel({
    required this.movieId,
    required this.l10n,
    required this.getMovieDetailUseCase,
    required this.addMovieFavoriteUseCase,
  });

  @override
  String get errorMessage => _errorMessage;

  @override
  bool get hasError => _hasError;

  @override
  bool get isLoading => _isLoading;

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
  }

  @override
  Future<void> onRefresh() {
    // TODO: implement onRefresh
    throw UnimplementedError();
  }

  void _setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  @override
  MovieDetail? get movieInfos {
    final movie = _movie;

    if (movie == null) {
      return null;
    }

    return movie;
  }

  @override
  void favoriteMovie() {
    final movie = _movie;

    if (movie == null) {
      return;
    }
    //TODO feedbacks for user and remove option if already added favorites
    return addMovieFavoriteUseCase.execute(movie: movie);
  }
}
