
import 'package:get_it/get_it.dart';
import 'package:movies_app/movies_module/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies_module/data/repo/movie_repo.dart';
import 'package:movies_app/movies_module/domain/base_repo/base_movie_repo.dart';
import 'package:movies_app/movies_module/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_app/movies_module/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_app/movies_module/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies_module/domain/usecases/get_recommendation_use_case.dart';
import 'package:movies_app/movies_module/domain/usecases/get_top_movies_usecase.dart';
import 'package:movies_app/movies_module/presentation/controler/movie_details_bloc.dart';
import 'package:movies_app/movies_module/presentation/controler/movies_bloc.dart';

final serviceLocator = GetIt.instance;
class ServicesLocator{
  void init(){
    
    serviceLocator.registerFactory(() => MovieBloc(serviceLocator(), serviceLocator(), serviceLocator(),));
    serviceLocator.registerFactory(() => MovieDetailsBloc(serviceLocator(),serviceLocator()));
    //Create use case
    serviceLocator.registerLazySingleton(() => GetNowPlayingUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(() => GetPopularMovieUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(() => GetTopMovieUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(() => GetMovieDetailsUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(() => GetRecommendationUseCase(serviceLocator()));

    //Create object of repo
    serviceLocator.registerLazySingleton<BaseMovieRepo>(() => MovieRepo(baseRemoteDataSource: serviceLocator()));

    //Create object of Data Source
    serviceLocator.registerLazySingleton<BaseRemoteDataSource>(() => MovieRemoteDataSource());

  }
}