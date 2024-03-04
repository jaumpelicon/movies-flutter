import 'package:isar/isar.dart';

import '../../../features/models/genre.dart';
import '../../../features/models/movie_details.dart';
import '../../../features/models/movie_favorite.dart';
import '../../../support/helpers/server_errors.dart';

typedef Success = void Function(List<MovieDetail> movies);
typedef Failure = void Function(ServerError error);

abstract class FavoriteDaoProtocol {
  Future<void> removeMovieFavorite({required int movieId});
  Future<void> insertMovieFavorite({required MovieDetail movie});

  Future<List<MovieFavorite>> getFavorites();
}

class FavoriteDao extends FavoriteDaoProtocol {
  final Isar db;

  FavoriteDao({required this.db});

  @override
  Future<void> insertMovieFavorite({required MovieDetail movie}) async {
    final favorite = MovieFavorite(
      movieId: movie.id,
      title: movie.title,
      rate: movie.rate as double,
      overview: movie.overview,
      posterPath: movie.posterImg,
      backdropPath: movie.backdropImg,
      releaseDate: movie.releaseDate,
    );
    favorite.genders.addAll(movie.genders);

    await db.writeTxn(() async {
      await db.movieFavorites.put(favorite);
      await db.genres.putAll(movie.genders);
      await favorite.genders.save();
    });

    // await _db.insert(
    //   FavoritesTable.tableName,
    //   movie.toMap(),
    //   conflictAlgorithm: ConflictAlgorithm.replace,
    // );
  }

  @override
  Future<void> removeMovieFavorite({required int movieId}) async {
    await db.writeTxn(() async {
      await db.movieFavorites.delete(movieId);
    });
    // await _db.delete(
    //   FavoritesTable.tableName,
    //   where: '${FavoritesTable.idColumn} = ?',
    //   whereArgs: [movieId],
    // );
  }

  @override
  Future<List<MovieFavorite>> getFavorites() async {
    // final favoritesMap = (await _db.query(FavoritesTable.tableName));
    // final movies = favoritesMap.map((movieMap) => MovieDetail.fromDatabase(movieMap)).toList();
    // return movies;
    return db.movieFavorites.where().findAll();
  }
}
