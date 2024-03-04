import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/models/genre.dart';
import '../../features/models/movie_favorite.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static DatabaseProvider instance = DatabaseProvider._();

  late Isar _db;

  bool _isInitialized = false;

  Isar get db {
    if (!_isInitialized) {
      throw Exception('Database not initialized');
    }

    return _db;
  }

  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();

    _db = await Isar.open(
      [MovieFavoriteSchema, GenreSchema],
      directory: dir.path,
    );

    _isInitialized = true;
  }
}
