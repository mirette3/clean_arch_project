import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies_module/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_app/movies_module/domain/usecases/get_recommendation_use_case.dart';
import 'package:movies_app/movies_module/presentation/controler/movie_details_event.dart';
import 'package:movies_app/movies_module/presentation/controler/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(MovieDetailsState()) {
    on<GetMoviesDetailsEvent>((event, emit) async {
      final result = await getMovieDetailsUseCase.execute(event.id);
      result.fold(
          (l) => emit(MovieDetailsState(
              requestState: RequestState.error, errorMessage: l.message)),
          (r) => emit(MovieDetailsState(
              movieDetails: r, requestState: RequestState.loaded)));
    });
    on<GetRecommendationMoviesEvent>((event, emit) async{
      final result = await getRecommendationUseCase.execute(event.id);
      result.fold(
              (l) => emit(MovieDetailsState(
              recommendRequestState: RequestState.error, recommentErrorMessage: l.message)),
              (r) => emit(MovieDetailsState(
              recommendations: r, recommendRequestState: RequestState.loaded)));

    });
  }
}
