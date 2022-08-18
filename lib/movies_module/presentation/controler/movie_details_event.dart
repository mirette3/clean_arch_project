abstract class MovieDetailsEvent{

  const MovieDetailsEvent();
}

class GetMoviesDetailsEvent extends MovieDetailsEvent{
  final int id ;

  const GetMoviesDetailsEvent(this.id);
}

class GetRecommendationMoviesEvent extends MovieDetailsEvent{
  final int id;

  const GetRecommendationMoviesEvent(this.id);
}