
import 'package:movies_app/movies_module/domain/entities/movie_details.dart';

class MoviesDetailsModel extends MovieDetails {
  MoviesDetailsModel(super.backdropPath,
      super.generIds,
      super.id,
      super.overview,
      super.releaseDate,
      super.runtime,
      super.title,
      super.voteAverage);

  factory MoviesDetailsModel.fromJson

  (

  Map<String, dynamic> json

  )

  =>

  MoviesDetailsModel(json['backdrop_path'],
  List<GenersModel>.from(json['genres'].map((x) => GenersModel.fromJson(x))), json['id'], json['overview'], json['release_date'],
      json['runtime'],
      json['title'], json['vote_average']..toDouble);
}

class GenersModel extends Genres{
  GenersModel(super.name, super.id);
  factory GenersModel.fromJson(Map<String,dynamic> json)=>
      GenersModel(json['name'], json['id']);
}


