class MovieDetails{
  final String backdropPath;
  final List<Genres> generIds;
  final int id;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;

  MovieDetails(this.backdropPath, this.generIds, this.id, this.overview,
      this.releaseDate, this.runtime, this.title, this.voteAverage);
}

class Genres {
 final String name;
 final int id;

 Genres(this.name, this.id);
}