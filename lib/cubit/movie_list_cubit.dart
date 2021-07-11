

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_your_story/model/movie_model.dart';
import 'package:flutter_app_your_story/repository/get_data_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_list_state.dart';

class MovieListCubit extends Cubit<MovieListState>{

  final GetMoviesRepository repository;
  MovieListCubit({this.repository}): super(LoadingState()){
    fetchMovies();
  }

  List<Result> moviesList=[];
  void fetchMovies() {
    emit(LoadingState());

    repository.fetchMoviesData().then((movies) {
      moviesList.clear();
      moviesList.addAll(movies);
      emit(LoadedState(moviesList: moviesList,base: 1.3));
    });

  }
  //double base =1;
  void changeSize(double size){
    //base= base+size;
    emit(LoadedState(base: size,moviesList: moviesList));
  }

}