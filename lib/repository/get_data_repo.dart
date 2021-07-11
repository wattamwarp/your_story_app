import 'package:flutter_app_your_story/model/movie_model.dart';
import 'package:flutter_app_your_story/service/get_movies_service.dart';

class GetMoviesRepository {
  final GetMoviesService getMoviesService;

  GetMoviesRepository({this.getMoviesService});

  Future<List<Result>> fetchMoviesData() async {
    final moviesList = await getMoviesService.getMovies();
    return moviesList;
  }
}
