import 'package:flutter/material.dart';

import '../movie_item.dart';
import '../movie_white_item.dart';

class MovieHorizontalList extends StatelessWidget {
  final List<MovieItemViewModelProtocol> viewModels;
  final bool isWhiteItem;

  const MovieHorizontalList({
    required this.viewModels,
    this.isWhiteItem = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 280,
      ),
      child: SizedBox(
        height: isWhiteItem ? 200 : 280,
        child: ListView.builder(
          itemCount: viewModels.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            final viewModel = viewModels[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isWhiteItem ? 320 : 154,
                ),
                child: SizedBox(
                  width: isWhiteItem ? 320 : 280,
                  child: isWhiteItem ? MovieWhiteItemView(viewModel: viewModel) : MovieItemView(viewModel: viewModel),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
