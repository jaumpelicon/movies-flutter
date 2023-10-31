import 'package:flutter/material.dart';

import '../movieDetails/di/movie_details_factory.dart';
import 'movie_favorites_view.dart';

abstract class MovieFavoritesProtocol extends MovieFavoritesViewModelProtocol {
  void getFavoritesMovies();
  ValueChanged<int>? onTapMovie;
}

class MovieFavoritesController extends StatefulWidget {
  final MovieFavoritesProtocol viewModel;
  const MovieFavoritesController({super.key, required this.viewModel});

  @override
  State<MovieFavoritesController> createState() => _MovieFavoritesControllerState();
}

class _MovieFavoritesControllerState extends State<MovieFavoritesController> {
  @override
  void initState() {
    super.initState();
    _bind();
    widget.viewModel.getFavoritesMovies();
  }

  void _bind() {
    widget.viewModel.onTapMovie = (movieId) {
      Navigator.pushNamed(context, MovieDetailsFactory.route, arguments: movieId);
    };
  }

  @override
  Widget build(BuildContext context) {
    return MovieFavoritesView(viewModel: widget.viewModel);
  }
}
