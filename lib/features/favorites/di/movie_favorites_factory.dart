import 'package:flutter/material.dart';

import '../../../api/database/dao/favorite_dao.dart';
import '../../../api/database/database_provider.dart';
import '../../../localization/localize.dart';
import '../movie_favorites_controller.dart';
import '../movie_favorites_view_model.dart';
import '../useCases/get_favorite_movies_use_case.dart';

class MovieFavoritesFactory {
  static const String route = '/favorites';
  static StatefulWidget favorites() {
    final database = DatabaseProvider.instance.db;
    final movieFavoritesDao = FavoriteDao(db: database);

    final l10n = Localize.instance.l10n;
    final favoriteUseCase = GetFavoritesUseCase(dao: movieFavoritesDao);
    final viewModel = MovieFavoritesViewModel(
      l10n: l10n,
      getFavoritesMoviesUseCase: favoriteUseCase,
    );
    return MovieFavoritesController(
      viewModel: viewModel,
    );
  }
}
