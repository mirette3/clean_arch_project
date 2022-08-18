import 'package:dartz/dartz.dart';
import 'package:movies_app/core/network/failuer.dart';
import 'package:movies_app/movies_module/domain/base_repo/base_movie_repo.dart';
import 'package:movies_app/movies_module/domain/entities/recommadition.dart';

class GetRecommendationUseCase {
  BaseMovieRepo baseMovieRepo;

  GetRecommendationUseCase(this.baseMovieRepo);

  //function to get data from api
  Future <Either<Failure,List<Recommndation>>> execute(int id) async {
    return await baseMovieRepo.getRecommendation(id);
  }
}
