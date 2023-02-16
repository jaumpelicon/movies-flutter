import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../models/movies.dart';
import '../movie_item_components/movie_item_view_model.dart';
import 'carousel_item.dart';

class CarouselMovieItemViewModel extends CarouselMovieItemViewModelProtocol {
  final Movie _movie;
  final bool _showRate;
  final MovieItemViewModelDelegate? delegate;
  final Localization l10n;

  CarouselMovieItemViewModel({
    required this.l10n,
    required Movie movie,
    required bool showRate,
    required this.delegate,
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
  void didTapKnowMore(int movieId) {
    delegate?.didTapMovie(movieId: movieId);
  }
}
