abstract class MoviesEvent {
  //Constructor
  const MoviesEvent();
}

class GetNowPlayingEvent extends MoviesEvent{}
class GetPopularMoviesEvent extends MoviesEvent{}
class GetTopMoviesEvent extends MoviesEvent{}
