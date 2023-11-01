import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../localization/localize.dart';
import '../../support/components/movie_item_components/movie_horizontal_list/movie_horizontal_list_shimmer.dart';
import '../../support/components/movie_search/components/search_bar.dart';
import '../../support/components/movie_search/movie_search_item_view.dart';
import '../../support/components/movie_search/movie_search_result_list.dart';
import '../../support/components/placeholders/error_screen.dart';
import '../../support/styles/application_typography.dart';

abstract class SearchMovieViewModelProtocol extends ChangeNotifier {
  bool get hasError;
  bool get isLoading;
  String get errorMessage;
  void getSearchMovies(String query);
  List<MovieSearchItemViewModelProtocol> get getSearchMoviesViewModels;
}

class SearchMovieView extends StatelessWidget {
  final SearchMovieViewModelProtocol viewModel;
  const SearchMovieView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (_, __) {
        return _placeHolder();
      },
    );
  }

  Widget _placeHolder() {
    final l10n = Localize.instance.l10n;
    if (viewModel.hasError) {
      return const ErrorPlaceholder();
    } else {
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomSearchBar(l10n: l10n, getSearchMovies: viewModel.getSearchMovies),
            ),
            const SizedBox(height: 4),
            _getSearchMoviesList(l10n)
          ],
        ),
      );
    }
  }

  Widget _getSearchMoviesList(Localization l10n) {
    if (viewModel.isLoading) {
      return const MovieHorizontalListShimmer();
    }

    if (viewModel.getSearchMoviesViewModels.isNotEmpty) {
      return MovieSearchResultList(viewModels: viewModel.getSearchMoviesViewModels);
    }

    return Expanded(
      child: Center(
        child: Text(
          l10n.trySearchMovieHintLabel,
          style: ApplicationTypography.nunitoSemiBoldWhite(16),
        ),
      ),
    );
  }
}
