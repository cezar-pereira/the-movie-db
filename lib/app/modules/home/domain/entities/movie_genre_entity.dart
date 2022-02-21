class MovieGenreEntity {
  final int id;
  final String name;

  MovieGenreEntity({required this.id, required this.name});

  @override
  String toString() => name;
}
