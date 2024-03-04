import 'package:isar/isar.dart';

import 'genre.dart';

part 'movie_favorite.g.dart';

@collection
class MovieFavorite {
  Id movieId;
  String title;
  double rate;
  String overview;
  String? releaseDate;
  String? posterPath;
  String? backdropPath;

  final genders = IsarLinks<Genre>();

  MovieFavorite({
    required this.movieId,
    required this.title,
    required this.rate,
    required this.overview,
    this.releaseDate,
    this.posterPath,
    this.backdropPath,
  });
}
