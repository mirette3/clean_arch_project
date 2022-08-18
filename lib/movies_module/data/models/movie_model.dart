import 'package:movies_app/movies_module/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({required super.id,
    required super.title,
    required super.backdropPath,
    required super.generIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate});

//convert response from json to dart
  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      MovieModel(id: json['id'],
          title: json['original_title'],
          backdropPath: json['backdrop_path'],
          generIds: List<int>.from(json['genre_ids'].map((e) => e)),
          overview: json["overview"],
          voteAverage: json['vote_average'].toDouble(),
          releaseDate: json['release_date']
      );
}
