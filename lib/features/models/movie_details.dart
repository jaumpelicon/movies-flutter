import '../../api/api_host.dart';
import '../../localization/localize.dart';
import 'database/favorite_table.dart';
import 'genre.dart';

class MovieDetail {
  final l10n = Localize.instance.l10n;

  final int id;
  final num rate;
  final String title;
  final String overview;
  final String releaseDate;
  final String? _posterPath;
  final String? _backdropPath;
  final List<Genre> genders;
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

  MovieDetail.fromDatabase(Map<String, dynamic> map)
      : id = map[FavoritesTable.idColumn],
        title = map[FavoritesTable.titleColumn],
        rate = map[FavoritesTable.rateColumn],
        overview = map[FavoritesTable.overviewColumn],
        _posterPath = map[FavoritesTable.posterPathColumn],
        _backdropPath = map[FavoritesTable.backdropPathColumn],
        releaseDate = map[FavoritesTable.releaseDateColumn],
        genders = [
          Genre.fromMap({'id': 1, 'name': 'action'})
        ];

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'title': title,
      'vote_average': rate,
      'overview': overview,
      'release_date': releaseDate,
      'poster_path': _posterPath,
      'backdrop_path': _backdropPath,
    };
    return map;
  }

  MovieDetail.fromMap(Map map)
      : id = map['id'],
        title = map['title'] ?? Localize.instance.l10n.unavailableMovieTitle,
        rate = map['vote_average'] ?? 0.0,
        overview = map['overview'] ?? Localize.instance.l10n.overviewUnavailableTitle,
        _posterPath = map['poster_path'],
        releaseDate = map['release_date'],
        _backdropPath = map['backdrop_path'],
        genders = List<Genre>.from(map['genres']?.map((map) => Genre.fromMap(map)));
}
