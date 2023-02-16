import 'db_type.dart';
import 'table.dart';

class FavoritesTable extends Table {
  @override
  String get create => 'CREATE TABLE $tableName '
      '($idColumn ${DBType.integer} NOT NULL PRIMARY KEY, '
      '$titleColumn ${DBType.text} NOT NULL, '
      '$rateColumn ${DBType.real} NOT NULL, '
      '$overviewColumn ${DBType.text} NOT NULL, '
      '$releaseDateColumn ${DBType.text} NOT NULL, '
      '$backdropPathColumn ${DBType.text} NOT NULL, '
      '$posterPathColumn ${DBType.text} NOT NULL);';

  static const String tableName = 'favorites';

  static const String idColumn = 'id';
  static const String titleColumn = 'title';
  static const String rateColumn = 'vote_average';
  static const String overviewColumn = 'overview';
  static const String releaseDateColumn = 'release_date';
  static const String posterPathColumn = 'poster_path';
  static const String backdropPathColumn = 'backdrop_path';
}
