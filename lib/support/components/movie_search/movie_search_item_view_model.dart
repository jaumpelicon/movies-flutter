import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../features/models/movies.dart';
import '../../extension/extension.dart';
import '../movie_item_components/movie_item_view_model.dart';
import 'movie_search_item_view.dart';

abstract class MovieItemViewModelProtocol {
  int get movieId;
  double get movieRate;
  String get movieTitle;
  String get moviePosterImg;

  void didTapMovie(int movieId);
}

class MovieSearchItemViewModel extends MovieSearchItemViewModelProtocol {
  final Movie _movie;
  final Localization l10n;
  final MovieItemViewModelDelegate? delegate;

  MovieSearchItemViewModel({
    required this.l10n,
    required Movie movie,
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
