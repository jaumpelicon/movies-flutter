import 'package:sqflite/sqflite.dart';

import '../../../features/models/database/favorite_table.dart';
import '../../../features/models/movie_details.dart';
import '../../../support/helpers/server_errors.dart';

typedef Success = void Function(List<MovieDetail> movies);
typedef Failure = void Function(ServerError error);

abstract class FavoriteDaoProtocol {
  Future<void> removeMovieFavorite({required int movieId});
  Future<void> insertMovieFavorite({required MovieDetail movie});

  Future<List<MovieDetail>> getFavorites();
}

class FavoriteDao extends FavoriteDaoProtocol {
  final Database _db;

  FavoriteDao({required Database db}) : _db = db;

  @override
  Future<void> insertMovieFavorite({required MovieDetail movie}) async {
    await _db.insert(
      FavoritesTable.tableName,
      movie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> removeMovieFavorite({required int movieId}) async {
    await _db.delete(
      FavoritesTable.tableName,
      where: '${FavoritesTable.idColumn} = ?',
      whereArgs: [movieId],
    );
  }

  @override
  Future<List<MovieDetail>> getFavorites() async {
    final favoritesMap = (await _db.query(FavoritesTable.tableName));
    final movies = favoritesMap.map((movieMap) => MovieDetail.fromDatabase(movieMap)).toList();
    return movies;
  }

  // TODO add remove favorite
}
