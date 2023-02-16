import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../localization/localize.dart';
import '../../styles/application_colors.dart';
import '../../styles/application_typography.dart';

abstract class MovieSearchItemViewModelProtocol {
  int get movieId;
  double get movieRate;
  String get movieTitle;
  String get releaseDate;
  String get moviePosterImg;

  void didTapMovie(int movieId);
}

class MovieSearchItemView extends StatelessWidget {
  final MovieSearchItemViewModelProtocol viewModel;
  const MovieSearchItemView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () => viewModel.didTapMovie(viewModel.movieId),
        child: Row(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 140),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Image.network(viewModel.moviePosterImg),
                ),
              ),
            ),
            const SizedBox(width: 28),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    viewModel.movieTitle,
                    style: ApplicationTypography.montserratSemiBoldWhite(16).apply(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                RatingBarIndicator(
                  unratedColor: ApplicationColors.gray,
                  rating: viewModel.movieRate,
                  itemBuilder: (_, __) => const Icon(
                    Icons.star,
                    color: ApplicationColors.amber,
                  ),
                  itemSize: 20.0,
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.releaseDateTitle,
                  style: ApplicationTypography.montserratSemiBoldWhite(12),
                ),
                const SizedBox(height: 8),
                Text(
                  viewModel.releaseDate,
                  style: ApplicationTypography.montserratSemiBoldWhite(12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
