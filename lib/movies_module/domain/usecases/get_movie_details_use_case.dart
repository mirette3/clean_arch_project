import 'package:dartz/dartz.dart';
import 'package:movies_app/core/network/failuer.dart';
import 'package:movies_app/movies_module/domain/base_repo/base_movie_repo.dart';
import 'package:movies_app/movies_module/domain/entities/movie_details.dart';

class GetMovieDetailsUseCase {
  BaseMovieRepo baseMovieRepo;

  GetMovieDetailsUseCase(this.baseMovieRepo);

  //function to get data from api
  Future <Either<Failure,MovieDetails>> execute(int movieId) async {
    return await baseMovieRepo.getMovieDetailes(movieId);
  }
}
