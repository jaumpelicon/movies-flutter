import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../features/models/movie_favorite.dart';
import '../../extension/extension.dart';
import 'movie_favorite_item.dart';

abstract class MovieItemViewModelDelegate {
  void didTapMovie({required int movieId});
}

class MovieFavoriteItemViewModel extends MovieFavoriteItemViewModelProtocol {
  final MovieFavorite _movie;
  final Localization l10n;
  final MovieItemViewModelDelegate? delegate;

  MovieFavoriteItemViewModel({
    required this.l10n,
    required MovieFavorite movie,
    required this.delegate,
    required bool showRate,
  }) : _movie = movie;

  @override
  int get movieId => _movie.movieId;

  @override
  String get movieTitle => '${_movie.title}\n';

  @override
  String get moviePosterImg => _movie.posterPath ?? '';

  @override
  double get movieRate => _movie.rate.toDouble() / 2;

  @override
  String get releaseDate {
    if (_movie.releaseDate?.isNotEmpty ?? false) {
      return _movie.releaseDate?.toFormatDate() ?? '';
    }
    return '01 Jan 1970';
  }

  @override
  void didTapMovie(int movieId) {
    delegate?.didTapMovie(movieId: movieId);
  }
}
