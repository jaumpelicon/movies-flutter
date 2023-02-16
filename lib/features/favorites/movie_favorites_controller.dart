import 'package:flutter/material.dart';

import 'movie_favorites_view.dart';

abstract class MovieFavoritesProtocol extends MovieFavoritesViewModelProtocol {
  void getFavoritesMovies();
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
    widget.viewModel.getFavoritesMovies();
  }

  @override
  Widget build(BuildContext context) {
    return MovieFavoritesView(viewModel: widget.viewModel);
  }
}
