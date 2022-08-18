class ApiConstants{
  static const baseURL = "https://api.themoviedb.org/3";
  static const apiKey ="api_key=4586ea8dac4b1b86b4936370c06000d4";
  static const nowPlayingPath='$baseURL/movie/now_playing?$apiKey';
  static const popularMoviePath='$baseURL/movie/popular?$apiKey';
  static const topMoviePath='$baseURL/movie/top_rated?$apiKey';
  static String movieDetailsPath(int movieId)=>
      '$baseURL/movie/$movieId?$apiKey';
static String recommendationPath(int movieId)=>
      '$baseURL/movie/$movieId/recommendations?$apiKey';
static const baseImageUrl='https://image.tmdb.org/t/p/w500';
static String imageUrl(String path )=>'$baseImageUrl$path';
}