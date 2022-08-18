
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/exceptions.dart';
import 'package:movies_app/core/network/failuer.dart';
import 'package:movies_app/movies_module/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies_module/domain/base_repo/base_movie_repo.dart';
import 'package:movies_app/movies_module/domain/entities/movie.dart';
import 'package:movies_app/movies_module/domain/entities/movie_details.dart';
import 'package:movies_app/movies_module/domain/entities/recommadition.dart';

class MovieRepo extends BaseMovieRepo{

  BaseRemoteDataSource baseRemoteDataSource;
  MovieRepo({required this.baseRemoteDataSource});
  @override
  Future <Either<Failure,List<Movie>>> getNowPlaying() async{
    final result = await baseRemoteDataSource.getNowPlaying();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future <Either<Failure,List<Movie>>> getPopularMovies() async{
    final result = await baseRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future <Either<Failure,List<Movie>>> getTopMovies() async{
    final result = await baseRemoteDataSource.getTopMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetailes(int movieId) async {
    final result = await baseRemoteDataSource.getMovieDetails(movieId);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommndation>>> getRecommendation(int id) async{
    final result = await baseRemoteDataSource.getRecommendation(id);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

}