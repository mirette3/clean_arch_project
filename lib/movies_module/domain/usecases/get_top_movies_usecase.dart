import 'package:dartz/dartz.dart';
import 'package:movies_app/core/network/failuer.dart';
import 'package:movies_app/movies_module/domain/base_repo/base_movie_repo.dart';
import 'package:movies_app/movies_module/domain/entities/movie.dart';

class GetTopMovieUseCase {
  BaseMovieRepo baseMovieRepo;

  GetTopMovieUseCase(this.baseMovieRepo);

  //function to get data from api
  Future <Either<Failure,List<Movie>>> execute() async {
    return await baseMovieRepo.getTopMovies();
  }
}
