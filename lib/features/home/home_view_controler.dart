import 'package:flutter/material.dart';

import '../movieDetails/di/movie_details_factory.dart';
import 'home_view.dart';

abstract class HomeProtocol extends HomeViewModelProtocol {
  void Function(int id)? onTapMovie;
  void getMostPopularMovies();
  void getTopRatedMovies();
}

class HomeViewController extends StatefulWidget {
  final HomeProtocol viewModel;

  const HomeViewController({super.key, required this.viewModel});

  @override
  State<HomeViewController> createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {
  @override
  void initState() {
    super.initState();
    _bind();
    widget.viewModel.getMostPopularMovies();
    widget.viewModel.getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(viewModel: widget.viewModel);
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }

  void _bind() {
    widget.viewModel.onTapMovie = (id) {
      Navigator.pushNamed(context, MovieDetailsFactory.route, arguments: id);
    };
  }
}
