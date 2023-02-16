import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../models/movies.dart';
import 'movie_item.dart';

abstract class MovieItemViewModelDelegate {
  void didTapMovie({required int movieId});
}

class MovieItemViewModel extends MovieItemViewModelProtocol {
  final Movie _movie;
  final bool _showRate;
  final Localization l10n;
  final MovieItemViewModelDelegate? delegate;

  MovieItemViewModel({
    required this.l10n,
    required Movie movie,
    required this.delegate,
    required bool showRate,
  })  : _movie = movie,
        _showRate = showRate;

  @override
  int get movieId => _movie.id;

  @override
  bool get showRate => _showRate;

  @override
  String get movieTitle => '${_movie.title}\n';

  @override
  String get moviePosterImg => _movie.posterImg;

  @override
  String get movieRate => l10n.movieRatingItemTitleLabel(_movie.rate.toStringAsFixed(1));

  @override
  void didTapMovie(int movieId) {
    delegate?.didTapMovie(movieId: movieId);
  }
}
