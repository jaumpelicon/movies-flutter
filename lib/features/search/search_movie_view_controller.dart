import 'package:flutter/material.dart';

import '../movieDetails/di/movie_details_factory.dart';
import 'search_movie_view.dart';

abstract class SearchMovieProtocol extends SearchMovieViewModelProtocol {
  void Function(int id)? onTapMovie;
}

class SearchMovieViewController extends StatefulWidget {
  final SearchMovieProtocol viewModel;
  const SearchMovieViewController({super.key, required this.viewModel});

  @override
  State<SearchMovieViewController> createState() => _SearchMovieViewControllerState();
}

class _SearchMovieViewControllerState extends State<SearchMovieViewController> {
  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchMovieView(
        viewModel: widget.viewModel,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.viewModel.dispose();
  }

  void _bind() {
    widget.viewModel.onTapMovie = (id) {
      Navigator.pushNamed(context, MovieDetailsFactory.route, arguments: id);
    };
  }
}
