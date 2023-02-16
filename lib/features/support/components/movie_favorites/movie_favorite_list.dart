import 'package:flutter/material.dart';

import 'movie_favorite_item.dart';

class MovieFavoriteList extends StatelessWidget {
  final List<MovieFavoriteItemViewModelProtocol> viewModels;

  const MovieFavoriteList({
    super.key,
    required this.viewModels,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      itemCount: viewModels.length,
      itemBuilder: (_, index) {
        final viewModel = viewModels[index];
        return ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 154,
          ),
          child: SizedBox(
            width: 280,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: MovieFavoriteItem(viewModel: viewModel),
            ),
          ),
        );
      },
    );
  }
}
