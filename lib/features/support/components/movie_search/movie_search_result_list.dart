import 'package:flutter/cupertino.dart';

import 'movie_search_item_view.dart';

class MovieSearchResultList extends StatelessWidget {
  final List<MovieSearchItemViewModelProtocol> viewModels;
  const MovieSearchResultList({super.key, required this.viewModels});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: viewModels.length,
        itemBuilder: (_, index) {
          final viewModel = viewModels[index];
          return MovieSearchItemView(viewModel: viewModel);
        },
      ),
    );
  }
}
