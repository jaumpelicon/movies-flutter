/// {@template movie_mason}
/// MovieMason description
/// {@endtemplate}
class MovieMason {
  /// {@macro movie_mason}
  const MovieMason({
    required this.name,
    required this.id,
  });

  /// Creates a MovieMason from Json map
  factory MovieMason.fromJson(Map<String, dynamic> json) => MovieMason(
        name: json['name'] as String,
        id: json['id'] as int,
      );

  /// A description for name
  final String name;

  /// A description for id
  final int id;

  /// Creates a copy of the current MovieMason with property changes
  MovieMason copyWith({
    String? name,
    int? id,
  }) {
    return MovieMason(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [
        name,
        id,
      ];

  /// Creates a Json map from a MovieMason
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'id': id,
      };
}
