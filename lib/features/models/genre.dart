import 'package:isar/isar.dart';

part 'genre.g.dart';

@collection
class Genre {
  Id id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  Genre.fromMap(Map map)
      : id = map['id'],
        name = map['name'];
}
