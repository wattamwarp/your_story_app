import 'package:flutter/material.dart';
import 'package:flutter_app_your_story/cubit/movie_list_cubit.dart';
import 'package:flutter_app_your_story/helper/helper.dart';
import 'package:flutter_app_your_story/model/movie_model.dart';
import 'package:flutter_app_your_story/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesList extends StatefulWidget {
  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    final _height = sizeConfig.safeHeight * 100;
    final _width = sizeConfig.safeWidth * 100;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => BlocProvider<MovieListCubit>.value(
              value: context.read<MovieListCubit>(),
              child: slider(context),
            ),
            isDismissible: false,
          );
        },
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<MovieListCubit, MovieListState>(
                  builder: (context, state) {
                if (state is LoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  List<Result> moviesList = (state as LoadedState).moviesList;

                  return Container(
                    height: _height - 56,
                    child: ListView.builder(
                        itemCount: moviesList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Container(
                              height: 150,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          height: 150,
                                          width: 100,
                                          child: ImageWidget(
                                            path:
                                                "${Urls.subUrl}${moviesList[index].posterPath.toString()}",
                                          )),
                                      Container(
                                        width: _width - 110,
                                        height: 150,
                                        //color: Colors.red,
                                        child: SingleChildScrollView(
                                            child: MoviesCardWidget(
                                                width: _width,
                                                height: _height,
                                                index: index,
                                                base:
                                                    (state as LoadedState).base,
                                                moviesList: moviesList)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget slider(BuildContext context) {
    bool tapped = false;
    return BlocBuilder<MovieListCubit, MovieListState>(
      builder: (context, state) {
        return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Container(
              width: 100,
              height: 50,
              child: Slider(
                min: 1,
                max: 2,
                value: (state as LoadedState).base,
                onChanged: (val) {
                  context.read<MovieListCubit>().changeSize(val);
                },
              ),
            ));
      },
    );
  }
}
