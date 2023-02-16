import 'package:flutter/material.dart';

import '../../localization/localize.dart';
import '../favorites/di/movie_favorites_factory.dart';
import '../home/di/home_factory.dart';
import '../search/di/search_movie_factory.dart';

abstract class NavigationViewModelProtocol with ChangeNotifier {
  int get currentIndex;
  void didTapSelectedIndex(int index);
}

class NavigationView extends StatelessWidget {
  final NavigationViewModelProtocol viewModel;
  final StatefulWidget _home = HomeFactory.home();
  final StatefulWidget _search = SearchMoviFactory.search();
  final StatefulWidget _favorites = MovieFavoritesFactory.favorites();

  NavigationView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;
    return AnimatedBuilder(
      animation: viewModel,
      builder: (_, __) {
        return Scaffold(
          body: IndexedStack(
            index: viewModel.currentIndex,
            children: [_home, _search, _favorites],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: viewModel.currentIndex,
            onTap: viewModel.didTapSelectedIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: l10n.homeTabBottomInputTitle,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.search),
                label: l10n.searchTabBottomInputTitle,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.star),
                label: l10n.favoriteTabBottomInputTitle,
              ),
            ],
          ),
        );
      },
    );
  }
}
