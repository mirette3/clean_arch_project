import 'package:dartz/dartz.dart';
import 'package:movies_app/core/network/failuer.dart';
import 'package:movies_app/movies_module/domain/entities/movie.dart';
import 'package:movies_app/movies_module/domain/entities/movie_details.dart';
import 'package:movies_app/movies_module/domain/entities/recommadition.dart';

//write all method you will need from api
abstract class BaseMovieRepo{
   Future <Either<Failure,List<Movie>>> getNowPlaying();
   Future <Either<Failure,List<Movie>>> getPopularMovies();
   Future <Either<Failure,List<Movie>>> getTopMovies();
   Future <Either<Failure,MovieDetails>> getMovieDetailes(int movieId);
   Future <Either<Failure,List<Recommndation>>> getRecommendation(int id);
}