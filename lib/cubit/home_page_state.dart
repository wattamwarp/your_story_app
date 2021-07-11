

part of 'home_page_cubit.dart';
abstract class HomePageState{}

class HomePageInitial extends HomePageState{}
class HomePageLoading extends HomePageState{}
class HomePageLoaded extends HomePageState{
  final List<Result> moviesList;
  HomePageLoaded({this.moviesList});
}
class HomePageError extends HomePageState{}