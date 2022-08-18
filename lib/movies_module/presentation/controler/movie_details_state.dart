import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies_module/domain/entities/movie_details.dart';
import 'package:movies_app/movies_module/domain/entities/recommadition.dart';

class MovieDetailsState {

 final MovieDetails? movieDetails;
 final RequestState requestState;
 final String errorMessage;
 final List<Recommndation> recommendations;
 final RequestState recommendRequestState;
 final String recommentErrorMessage;

 MovieDetailsState({this.movieDetails, this.requestState=RequestState.loading, this.errorMessage='',this.recommendations=const [],this.recommendRequestState=RequestState.loading,this.recommentErrorMessage=''});
}