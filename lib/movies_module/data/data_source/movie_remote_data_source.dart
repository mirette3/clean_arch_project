//all data source we need
//aw bm3na as7 b3mal implementation la kol al methods ali 3rftha abl kda fe al domain

import 'package:dio/dio.dart';
import 'package:movies_app/core/exceptions.dart';
import 'package:movies_app/core/network/error_message.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/movies_module/data/models/movie_details_model.dart';
import 'package:movies_app/movies_module/data/models/movie_model.dart';
import 'package:movies_app/movies_module/data/models/recommendation_model.dart';

abstract class BaseRemoteDataSource{
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopMovies();
  Future<MoviesDetailsModel> getMovieDetails(int movieId);
  Future<List<RecommendationModel>> getRecommendation(int id);
}

class MovieRemoteDataSource extends BaseRemoteDataSource{
  //a3mal call ll api (al end point alii m7tgaha)
  @override
  Future<List<MovieModel>> getNowPlaying() async {
    //get data from api and stored it in var
    final response = await Dio().get(ApiConstants.nowPlayingPath);
//check if response get right then return list mn al movies from results object as list
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {

      //lw 7sal error fe al response y2oli eih hwa
throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response = await Dio().get(ApiConstants.popularMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
            (e) => MovieModel.fromJson(e),
      ));
    } else {

      //lw 7sal error fe al response y2oli eih hwa
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopMovies() async {
    final response = await Dio().get(ApiConstants.topMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
            (e) => MovieModel.fromJson(e),
      ));
    } else {

      //lw 7sal error fe al response y2oli eih hwa
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MoviesDetailsModel> getMovieDetails(int movieId)async {
    final response = await Dio().get(ApiConstants.movieDetailsPath(movieId));
    if (response.statusCode == 200) {
      return MoviesDetailsModel.fromJson(response.data);
    } else {

      //lw 7sal error fe al response y2oli eih hwa
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(int id) async{
    final response = await Dio().get(ApiConstants.recommendationPath(id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List).map(
            (e) => RecommendationModel.fromJson(e),
      ));
    } else {

      //lw 7sal error fe al response y2oli eih hwa
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

}
