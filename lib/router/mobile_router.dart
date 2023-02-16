import 'package:flutter/material.dart';

import '../features/favorites/di/movie_favorites_factory.dart';
import '../features/movieDetails/di/movie_details_factory.dart';
import '../features/navigation/di/navigation_factory.dart';
import '../features/splash/di/splash_factory.dart';

class MobileRouter {
  static const String initialRoute = SplashFactory.route;

  static final Map<String, WidgetBuilder> routes = {
    SplashFactory.route: (_) => SplashFactory.splash(),
    NavigationFactory.route: (_) => NavigationFactory.navigation(),
    MovieFavoritesFactory.route: (_) => MovieFavoritesFactory.favorites(),
    MovieDetailsFactory.route: (context) {
      final movieIdArguments = ModalRoute.of(context)!.settings.arguments as int;
      return MovieDetailsFactory.movieDetails(movieIdArguments);
    }
  };
}
