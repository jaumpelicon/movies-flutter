import 'package:flutter/cupertino.dart';

import 'movie_details_view.dart';

abstract class MovieDetailsProtocol extends MovieDetailsViewModelProtocol {
  void getMovieById();

  void Function()? onTapBackButton;
}

class MovieDetailsViewController extends StatefulWidget {
  final MovieDetailsProtocol viewModel;
  const MovieDetailsViewController({super.key, required this.viewModel});

  @override
  State<MovieDetailsViewController> createState() => _MovieDetailsViewControllerState();
}

class _MovieDetailsViewControllerState extends State<MovieDetailsViewController> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getMovieById();
  }

  @override
  Widget build(BuildContext context) {
    return MovieDetailsView(viewModel: widget.viewModel);
  }
}
