import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies_module/domain/entities/movie.dart';

class MoviesState {
  //fe 7alet an al data gat ashoufha
 final List<Movie> nowPlayingMovies;
  //a3rf ana fe anhy state
 final RequestState nowPlayingState;
  //lw 7sal error
 final String errorMessage;

 final List<Movie> popularMovies;
  //a3rf ana fe anhy state
 final RequestState popularMoviesState;
  //lw 7sal error
 final String popularMoviesErrorMessage;


 final List<Movie> topMovies;
  //a3rf ana fe anhy state
 final RequestState topMoviesState;
  //lw 7sal error
 final String topMoviesErrorMessage;



 const MoviesState(
     {this.popularMovies= const[],
     this.popularMoviesState=RequestState.loading,
     this.popularMoviesErrorMessage="",
     this.topMovies=const[],
     this.topMoviesState=RequestState.loading,
     this.topMoviesErrorMessage="",
     this.nowPlayingMovies = const[],
       this.nowPlayingState = RequestState.loading,
       this.errorMessage='',});
}