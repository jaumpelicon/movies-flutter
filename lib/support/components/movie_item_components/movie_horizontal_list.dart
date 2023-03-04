import 'package:flutter/material.dart';

import 'movie_item.dart';

class MovieHorizontalList extends StatelessWidget {
  final List<MovieItemViewModelProtocol> viewModels;

  const MovieHorizontalList({
    super.key,
    required this.viewModels,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 280,
      ),
      child: SizedBox(
        height: 280,
        child: ListView.builder(
          itemCount: viewModels.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            final viewModel = viewModels[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 154,
                ),
                child: SizedBox(
                  width: 280,
                  child: MovieItemView(viewModel: viewModel),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
