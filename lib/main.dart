import 'package:flutter/material.dart';
import 'package:flutter_app_your_story/cubit/home_page_cubit.dart';
import 'package:flutter_app_your_story/cubit/movie_list_cubit.dart';
import 'screens/landing_page.dart';
import 'package:flutter_app_your_story/repository/get_data_repo.dart';
import 'package:flutter_app_your_story/service/get_movies_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/bottom_nav_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => GetMoviesRepository(getMoviesService: GetMoviesService()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BottomNavCubit()),
          BlocProvider(create: (context) => HomePageCubit(repository:context.read<GetMoviesRepository>() )),
          BlocProvider(create: (context) => MovieListCubit(repository: context.read<GetMoviesRepository>()))
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          home: LandingPage(),
        ),
      ),
    );
  }
}

