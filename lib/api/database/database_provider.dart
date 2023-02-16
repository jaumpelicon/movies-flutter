import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/models/database/favorite_table.dart';
import '../../features/models/database/table.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static DatabaseProvider instance = DatabaseProvider._();

  late Database _db;

  bool _isInitialized = false;

  List<Table> tables = [FavoritesTable()];

  Database get db {
    if (!_isInitialized) {
      throw Exception('Database not initialized');
    }

    return _db;
  }

  Future<void> initialize() async {
    final databasesPath = await getDatabasesPath();

    final path = join(databasesPath, 'movie_favorite.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int _) async {
        final batch = db.batch();

        for (final table in tables) {
          batch.execute(table.create);
        }

        await batch.commit();
      },
    );

    _isInitialized = true;
  }
}
