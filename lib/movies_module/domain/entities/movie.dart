class Movie {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> generIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const Movie( {
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.generIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate
  });
}
