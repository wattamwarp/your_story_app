import 'dart:async';

import 'package:flutter_app_your_story/model/movie_model.dart';
import 'package:flutter_app_your_story/repository/get_data_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_state.dart';
class HomePageCubit extends Cubit<HomePageState>{
  final GetMoviesRepository repository;

  HomePageCubit({this.repository}) : super(HomePageInitial());

  void fetchMovies() {
    emit(HomePageLoading());
    // Timer(Duration(seconds: 3), () {
    //   var a= repository.fetchMoviesData();
    //   print('the var is '+a.toString());
    //   repository.fetchMoviesData().then((movies) {
    //     emit(HomePageLoaded(moviesList: movies));
    //   });
    // });

    repository.fetchMoviesData().then((movies) {
          emit(HomePageLoaded(moviesList: movies));
       });

  }

}