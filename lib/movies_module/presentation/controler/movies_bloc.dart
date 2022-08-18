import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies_module/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_app/movies_module/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies_module/presentation/controler/movies_event.dart';
import 'package:movies_app/movies_module/presentation/controler/movies_states.dart';

import '../../domain/usecases/get_top_movies_usecase.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  //Constructor
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularMovieUseCase getPopularMovieUseCase;
  final GetTopMovieUseCase getTopMovieUseCase;

  MovieBloc(this.getNowPlayingUseCase, this.getPopularMovieUseCase,
      this.getTopMovieUseCase)
      : super(const MoviesState()) {
    //Now we will call events inside the bloc

    //using "ON<EventName>" to add events to the bloc
    //emit used to change the state of the process
    on<GetNowPlayingEvent>((event, emit) async {
      final result = await getNowPlayingUseCase.execute();
      result.fold(
          (l) => emit(MoviesState(
              nowPlayingState: RequestState.error, errorMessage: l.message)),
          (r) => emit(MoviesState(
              nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMovieUseCase.execute();
      result.fold(
          (l) => emit(MoviesState(
              popularMoviesState: RequestState.error,
              popularMoviesErrorMessage: l.message)),
          (r) => emit(MoviesState(
              popularMovies: r, popularMoviesState: RequestState.loaded)));
    });

    on<GetTopMoviesEvent>((event, emit) async {
      final result = await getTopMovieUseCase.execute();
      result.fold(
          (l) => emit(MoviesState(
              topMoviesState: RequestState.error,
              topMoviesErrorMessage: l.message)),
          (r) => emit(
              MoviesState(topMovies: r, topMoviesState: RequestState.loaded)));
    });
  }
}
