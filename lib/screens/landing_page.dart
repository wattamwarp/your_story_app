import 'package:flutter/material.dart';
import 'package:flutter_app_your_story/screens/movie_detail.dart';
import 'package:flutter_app_your_story/screens/movies_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/bottom_nav_cubit.dart';
import '../main.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _pageNavigation = [
    MovieDetail(),
    MoviesList(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: _buildBody(state),
          bottomNavigationBar: _buildBottomNav(),
        );
      },
    );
  }

  Widget _buildBody(int index) {
    return _pageNavigation.elementAt(index);
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: context.read<BottomNavCubit>().state,
      type: BottomNavigationBarType.fixed,
      onTap: _getChangeBottomNav,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Movie detail"),
        BottomNavigationBarItem(icon: Icon(Icons.date_range), label: "Movie List"),
      ],
    );
  }

  void _getChangeBottomNav(int index) {
    context.read<BottomNavCubit>().updateIndex(index);
  }
}