import 'package:flutter/material.dart';

import '../../../api/routes/movies_routes.dart';
import '../../../localization/localize.dart';
import '../search_movie_view_controller.dart';
import '../search_movie_view_model.dart';
import '../useCases/search_movie_use_case.dart';

class SearchMoviFactory {
  static const String route = '/search';
  static StatefulWidget search() {
    final l10n = Localize.instance.l10n;
    final moviesRoutes = MoviesRoutes();
    final getSearchMoviesUseCase = GetSearchMoviesUseCase(routes: moviesRoutes);
    final viewModel = SearchMovieViewModel(
      l10n: l10n,
      getSearchMoviesUseCase: getSearchMoviesUseCase,
    );

    return SearchMovieViewController(viewModel: viewModel);
  }
}
