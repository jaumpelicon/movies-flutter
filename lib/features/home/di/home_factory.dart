import 'package:flutter/material.dart';

import '../../../api/routes/movies_routes.dart';
import '../../../localization/localize.dart';
import '../home_view_controler.dart';
import '../home_view_model.dart';
import '../useCases/get_most_popular_use_case.dart';
import '../useCases/get_now_playing_use_case.dart';
import '../useCases/get_top_rated_use_case.dart';
import '../useCases/get_up_coming_use_case.dart';

class HomeFactory {
  static const String route = '/home';
  static StatefulWidget home() {
    final moviesRoutes = MoviesRoutes();
    final l10n = Localize.instance.l10n;

    final getUpComingMoviesUseCase = GetUpComingMoviesUseCase(routes: moviesRoutes);
    final getTopRatedMoviesUseCase = GetTopRatedMoviesUseCase(routes: moviesRoutes);
    final getMostPopularMoviesUseCase = GetMostPopularMoviesUseCase(routes: moviesRoutes);
    final getNowPlayingMoviesUseCase = GetNowPlayingMoviesUseCase(routes: moviesRoutes);

    final viewModel = HomeViewModel(
      l10n: l10n,
      getUpComingMoviesUseCase: getUpComingMoviesUseCase,
      getTopRatedMoviesUseCase: getTopRatedMoviesUseCase,
      getMostPopularMoviesUseCase: getMostPopularMoviesUseCase,
      getNowPlayingMoviesUseCase: getNowPlayingMoviesUseCase,
    );

    return HomeViewController(viewModel: viewModel);
  }
}
