import 'package:flutter/material.dart';
import 'package:flutter_app_your_story/cubit/home_page_cubit.dart';
import 'package:flutter_app_your_story/helper/helper.dart';
import 'package:flutter_app_your_story/model/movie_model.dart';
import 'package:flutter_app_your_story/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetail extends StatefulWidget {
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {



  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    final _height = sizeConfig.safeHeight *100;
    final _width =sizeConfig.safeWidth*100;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
          if (state is HomePageLoaded) {
            Result movies = state.moviesList[0];
            return Container(
              child: Center(
                  child: InkWell(
                      onTap: () {
                        BlocProvider.of<HomePageCubit>(context).fetchMovies();
                      },
                      child: Column(
                        children: [
                          Container(
                            width: _width,
                            height: _height * 0.40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40)),
                              child:ImageWidget(path: "https://image.tmdb.org/t/p/original${movies.posterPath.toString()}"),

                              // image("https://image.tmdb.org/t/p/original${movies.posterPath.toString()}"),
                            ),
                          ),
                          Container(
                            width: _width,
                            height: _height * 0.60 - 56,
                            child: MovieDetailCard(
                              width: _width,movies: movies,
                            ),
                          )
                        ],
                      ))),
            );
          } else if (state is HomePageLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return Container(
            child: InkWell(
                onTap: () {
                  BlocProvider.of<HomePageCubit>(context).fetchMovies();
                },
                child: Center(child: Container(
                    height: 50,
                    width: 200,
                    color: Colors.blue,
                    child: Center(child: Text('Get Movie Detail',style: TextStyle(
                      color: Colors.white
                    ),),),),),),
          );
        }),
      ),
    );
  }

}

