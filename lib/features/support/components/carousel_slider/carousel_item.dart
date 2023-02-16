import 'package:flutter/material.dart';

import '../../../../localization/localize.dart';
import '../../styles/application_colors.dart';
import '../../styles/application_typography.dart';

abstract class CarouselMovieItemViewModelProtocol {
  int get movieId;
  String get movieRate;
  bool get showRate;
  String get movieTitle;
  String get moviePosterImg;

  void didTapKnowMore(int movieId);
}

class MovieCarouselItem extends StatelessWidget {
  final CarouselMovieItemViewModelProtocol viewModel;

  const MovieCarouselItem({super.key, required this.viewModel});
  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              viewModel.moviePosterImg,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 8,
            bottom: 44,
            child: Container(
              width: 80,
              height: 36,
              padding: const EdgeInsets.all(4.0),
              alignment: Alignment.bottomRight,
              child: Visibility(
                visible: viewModel.showRate,
                child: Container(
                  decoration: BoxDecoration(
                    color: ApplicationColors.green1,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    viewModel.movieRate,
                    style: ApplicationTypography.nunitoSemiBoldWhite(14),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: Container(
              width: 120,
              height: 40,
              padding: const EdgeInsets.all(4.0),
              alignment: Alignment.bottomRight,
              child: Visibility(
                visible: viewModel.showRate,
                child: Container(
                  decoration: BoxDecoration(
                    color: ApplicationColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      viewModel.didTapKnowMore(viewModel.movieId);
                    },
                    child: Text(
                      l10n.knowMoreInputTitle,
                      style: ApplicationTypography.nunitoBoldBlack(14),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
