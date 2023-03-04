import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../localization/localize.dart';
import '../../support/components/carousel_slider/caroulsel_item_shimmer.dart';
import '../../support/components/carousel_slider/carousel_item.dart';
import '../../support/components/carousel_slider/carousel_list.dart';
import '../../support/components/movie_item_components/movie_horizontal_list.dart';
import '../../support/components/movie_item_components/movie_horizontal_list_shimmer.dart';
import '../../support/components/movie_item_components/movie_item.dart';
import '../../support/components/placeholders/error_screen.dart';
import '../../support/styles/application_images.dart';
import '../../support/styles/application_typography.dart';

abstract class HomeViewModelProtocol with ChangeNotifier {
  bool get hasError;
  bool get isLoading;
  String get errorMessage;
  Future<void> onRefresh();
  List<MovieItemViewModelProtocol> get topRatedMoviesViewModels;
  List<CarouselMovieItemViewModelProtocol> get mostPopularMoviesCarouselViewModels;
}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          return Scaffold(
            body: CustomRefreshIndicator(
              onRefresh: viewModel.onRefresh,
              offsetToArmed: 120.0,
              builder: ((
                _,
                child,
                controller,
              ) =>
                  _swipeRefreshBuilderWidget(controller, child)),
              child: _placeholdersScreenWidget(),
            ),
          );
        });
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

  Widget _placeholdersScreenWidget() {
    final l10n = Localize.instance.l10n;

    if (viewModel.hasError) {
      return const ErrorPlaceholder();
    } else {
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _mostPopularMoviesCarouselWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 20.0),
                child: Text(
                  l10n.criticallyAcclaimedTitle,
                  style: ApplicationTypography.montserratSemiBoldWhite(20),
                ),
              ),
              const SizedBox(height: 28),
              _topRatedMoviesListWidget(),
            ],
          ),
        ),
      );
    }
  }

  Widget _topRatedMoviesListWidget() {
    if (viewModel.isLoading) {
      return const MovieHorizontalListShimmer();
    }

    return MovieHorizontalList(
      viewModels: viewModel.topRatedMoviesViewModels,
    );
  }

  Widget _mostPopularMoviesCarouselWidget() {
    if (viewModel.isLoading) {
      return const MovieCarouselShimmerItem();
    }

    return CarouselList(
      viewModels: viewModel.mostPopularMoviesCarouselViewModels,
    );
  }
}
