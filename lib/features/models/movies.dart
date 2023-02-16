import '../../api/api_host.dart';
import '../../localization/localize.dart';

class Movie {
  final int id;
  final num rate;
  final String title;
  final String overview;
  final String? _posterPath;
  final String? _backdropPath;
  final String releaseDate;

  String get posterImg {
    if (_posterPath != null) {
      return '${ApiHost.baseImageURL}$_posterPath';
    }
    return 'https://i.postimg.cc/zvpNGNqC/poster-image-placeholder.jpg';
  }

  String get backdropImg {
    if (_backdropPath != null) {
      return '${ApiHost.baseImageURL}$_backdropPath';
    }
    return 'https://i.postimg.cc/zvpNGNqC/poster-image-placeholder.jpg';
  }

  Movie.fromMap(Map map)
      : id = map['id'],
        title = map['title'] ?? Localize.instance.l10n.unavailableMovieTitle,
        rate = map['vote_average'] ?? 0.0,
        overview = map['overview'] ?? Localize.instance.l10n.overviewUnavailableTitle,
        _posterPath = map['poster_path'],
        releaseDate = map['release_date'] ?? '1970-01-01',
        _backdropPath = map['backdrop_path'];
}
