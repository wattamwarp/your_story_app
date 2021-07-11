

part of'movie_list_cubit.dart';

abstract class MovieListState{}
//class InitialState extends MovieListState{}
class LoadingState extends MovieListState{}
class LoadedState extends MovieListState{
  double base=1;
  List<Result> moviesList;
  LoadedState({this.moviesList,this.base});

   LoadedState copyWith(
  {
   int base,
    List<Result> moviesList
}
       ){
     base:base !=null?base: this.base;
     moviesList:moviesList!=null? moviesList: this.moviesList;

   }

}
// class ErrorState extends MovieListState{}
// class ChangeSizeState extends MovieListState{
//   int base;
//   ChangeSizeState({this.base});
//
// }

