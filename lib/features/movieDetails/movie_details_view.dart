import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../localization/localize.dart';
import '../models/movie_details.dart';
import '../../support/components/movie_detail/circular_icon_button.dart';
import '../../support/components/movie_detail/overview_component.dart';
import '../../support/components/placeholders/error_screen.dart';
import '../../support/extension/extension.dart';
import '../../support/styles/application_colors.dart';
import '../../support/styles/application_typography.dart';

abstract class MovieDetailsViewModelProtocol with ChangeNotifier {
  bool get hasError;
  bool get isLoading;
  String get errorMessage;
  MovieDetail? get movieInfos;

  Future<void> onRefresh();
  void favoriteMovie();
}

class MovieDetailsView extends StatelessWidget {
  final l10n = Localize.instance.l10n;
  final MovieDetailsViewModelProtocol viewModel;

  MovieDetailsView({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          return _movieDetailWidget();
        },
      ),
    );
  }

  Widget _movieDetailWidget() {
    final movieDetail = viewModel.movieInfos;
    const movieRatingCalculation = 2;

    if (viewModel.isLoading) {
      return const CircularProgressIndicator();
    }
    if (movieDetail != null) {
      return ListView(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 400),
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 228),
                  child: Image.network(
                    movieDetail.backdropImg,
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: InkWell(
                    onTap: viewModel.favoriteMovie,
                    child: const CircularIconButton(icon: Icons.favorite),
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 16,
                  child: Row(
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 200),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          child: Image.network(movieDetail.posterImg),
                        ),
                      ),
                      const SizedBox(width: 28),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          SizedBox(
                            width: 200,
                            child: Text(
                              movieDetail.title,
                              overflow: TextOverflow.ellipsis,
                              style: ApplicationTypography.montserratSemiBoldWhite(16),
                            ),
                          ),
                          RatingBarIndicator(
                            unratedColor: ApplicationColors.gray,
                            rating: movieDetail.rate.toDouble() / movieRatingCalculation,
                            itemBuilder: (_, __) => const Icon(
                              Icons.star,
                              color: ApplicationColors.amber,
                            ),
                            itemSize: 20.0,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            l10n.releaseDateTitle,
                            style: ApplicationTypography.montserratSemiBoldWhite(14),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            movieDetail.releaseDate.toFormatDate(),
                            style: ApplicationTypography.montserratSemiBoldWhite(14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _gendersList(movieDetail),
          const SizedBox(height: 12),
          OverviewCard(overview: movieDetail.overview),
        ],
      );
    }

    return const ErrorPlaceholder();
  }

  Widget _gendersList(MovieDetail movieDetail) {
    return SizedBox(
      height: 40,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieDetail.genders.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            final genderName = movieDetail.genders[index].name;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: ApplicationColors.green1,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  genderName,
                  style: ApplicationTypography.montserratSemiBoldWhite(14)
                      .apply(backgroundColor: ApplicationColors.green1),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
