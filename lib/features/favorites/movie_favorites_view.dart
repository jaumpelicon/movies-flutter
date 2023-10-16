import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../localization/localize.dart';
import '../../support/components/movie_favorites/movie_favorite_item.dart';
import '../../support/components/movie_favorites/movie_favorite_list.dart';
import '../../support/components/movie_item_components/movie_horizontal_list_shimmer.dart';
import '../../support/components/placeholders/empty_screen.dart';
import '../../support/styles/application_images.dart';
import '../../support/styles/application_typography.dart';

abstract class MovieFavoritesViewModelProtocol extends ChangeNotifier {
  bool get hasError;
  bool get isLoading;
  String get errorMessage;
  List<MovieFavoriteItemViewModelProtocol> get favoritesMovies;

  Future<void> onRefresh();
}

class MovieFavoritesView extends StatelessWidget {
  final MovieFavoritesViewModelProtocol viewModel;

  const MovieFavoritesView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (_, __) {
        return Scaffold(
          body: CustomRefreshIndicator(
            onRefresh: viewModel.onRefresh,
            offsetToArmed: 120.0,
            builder: ((_, Widget child, IndicatorController controller) {
              return _swipeRefreshBuilderWidget(controller, child);
            }),
            child: _favoritesMoviesListWidget(),
          ),
        );
      },
    );
  }

  Widget _favoritesMoviesListWidget() {
    final l10n = Localize.instance.l10n;

    if (viewModel.isLoading) {
      return const MovieHorizontalListShimmer();
    }

    if (viewModel.favoritesMovies.isEmpty) {
      return EmptyPlaceholder(
        title: l10n.favoriteMoviesTitle,
        description: l10n.emptyFavoritesMessage,
      );
    }

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              l10n.favoriteMoviesTitle,
              style: ApplicationTypography.nunitoSemiBoldWhite(20),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: MovieFavoriteList(viewModels: viewModel.favoritesMovies),
          )
        ],
      ),
    );
  }

  Widget _swipeRefreshBuilderWidget(
    IndicatorController controller,
    Widget child,
  ) {
    const armed = 120.0;
    return AnimatedBuilder(
      animation: viewModel,
      builder: ((_, __) {
        return Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 120.0, maxWidth: 180.0),
                child: SizedBox(
                  width: double.infinity,
                  height: armed * controller.value,
                  child: Lottie.asset(
                    AppImage.swipeRefreshAnimation,
                    fit: BoxFit.cover,
                    animate: true,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0.0, armed * controller.value),
              child: child,
            )
          ],
        );
      }),
      child: child,
    );
  }
}
