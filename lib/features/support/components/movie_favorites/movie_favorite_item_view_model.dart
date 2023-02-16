import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../models/movie_details.dart';
import '../../extension/extension.dart';
import 'movie_favorite_item.dart';

abstract class MovieItemViewModelDelegate {
  void didTapMovie({required int movieId});
}

class MovieFavoriteItemViewModel extends MovieFavoriteItemViewModelProtocol {
  final MovieDetail _movie;
  final Localization l10n;
  final MovieItemViewModelDelegate? delegate;

  MovieFavoriteItemViewModel({
    required this.l10n,
    required MovieDetail movie,
    required this.delegate,
    required bool showRate,
  }) : _movie = movie;

  @override
  int get movieId => _movie.id;

  @override
  String get movieTitle => '${_movie.title}\n';

  @override
  String get moviePosterImg => _movie.posterImg;

  @override
  double get movieRate => _movie.rate.toDouble() / 2;

  @override
  String get releaseDate {
    if (_movie.releaseDate.isNotEmpty) {
      return _movie.releaseDate.toFormatDate();
    }
    return '01 Jan 1970';
  }

  @override
  void didTapMovie(int movieId) {
    delegate?.didTapMovie(movieId: movieId);
  }
}
