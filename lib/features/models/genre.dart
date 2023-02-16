class Genre {
  int id;
  String name;

  Genre.fromMap(Map map)
      : id = map['id'],
        name = map['name'];
}
