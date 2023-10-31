import 'package:flutter/material.dart';

import '../../../api/database/dao/favorite_dao.dart';
import '../../../api/database/database_provider.dart';
import '../../../api/routes/movies_routes.dart';
import '../../../localization/localize.dart';
import '../../favorites/useCases/get_favorite_movies_use_case.dart';
import '../movie_details_view_controller.dart';
import '../movie_details_view_model.dart';
import '../useCases/add_movie_favorite_use_case.dart';
import '../useCases/get_movie_details_use_case.dart';
import '../useCases/remove_movie_favorite_use_case.dart';

class MovieDetailsFactory {
  static const String route = '/details';
  static StatefulWidget movieDetails(int movieId) {
    final moviesRoutes = MoviesRoutes();
    final l10n = Localize.instance.l10n;
    final database = DatabaseProvider.instance.db;
    final movieFavoritesDao = FavoriteDao(db: database);
    final getMovieDetailUseCase = GetMovieDetailUseCase(routes: moviesRoutes);
    final getFavoriteUseCase = GetFavoritesUseCase(dao: movieFavoritesDao);
    final removeFavoriteUseCase = RemoveMovieFavoriteUseCase(dao: movieFavoritesDao, l10n: l10n);
    final addMovieFavoriteUseCase = AddMovieFavoriteUseCase(dao: movieFavoritesDao, l10n: l10n);
    final viewModel = MovieDetailsViewModel(
      movieId: movieId,
      l10n: l10n,
      getMovieDetailUseCase: getMovieDetailUseCase,
      addMovieFavoriteUseCase: addMovieFavoriteUseCase,
      getFavoritesUseCase: getFavoriteUseCase,
      removeMovieFavoriteUseCase: removeFavoriteUseCase,
    );

    return MovieDetailsViewController(viewModel: viewModel);
  }
}
