import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jeraflix_pelicom/features/home/home_view_model.dart';
import 'package:jeraflix_pelicom/features/models/movies.dart';

import '../../localization/localize_mock.dart';
import 'mocks/get_most_popular_use_case_mock.dart';
import 'mocks/get_top_rated_use_case_mock.dart';

void main() {
  late HomeViewModel sut;
  late Localization l10n;
  late GetMostPopularUseCaseMock getMostPopularMock;
  late GetTopRatedMoviesUseCaseMock getTopRatedMoviesMock;

  setUp(() {
    getMostPopularMock = GetMostPopularUseCaseMock();
    getTopRatedMoviesMock = GetTopRatedMoviesUseCaseMock();
    l10n = LocalizeMock.instance.l10n;
    sut = HomeViewModel(
      l10n: l10n,
      getMostPopularMoviesUseCase: getMostPopularMock,
      getTopRatedMoviesUseCase: getTopRatedMoviesMock,
    );
  });

  test(
    'Test getTopRatedMovies when getTopRatedMoviesUseCase return success, expect populate movie list',
    () {
      getTopRatedMoviesMock.movies = [
        Movie.fromMap(
          {
            'id': 10,
            'title': 'MIb 1 Omen de PRETO',
            'vote_average': 9.0,
            'overview': 'Filme de alienigena',
            'poster_path': '/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg',
            'backdrop_path': '/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg',
            'genres': [1, 2, 3],
          },
        )
      ];

      sut.getTopRatedMovies();

      expect(sut.topRatedMoviesViewModels, isNotEmpty);
    },
  );

  test(
    'Test getMostPopularMovies when getMostPopularMoviesUseCase return success, expect populate movie list',
    () {
      getMostPopularMock.movies = [
        Movie.fromMap(
          {
            'id': 10,
            'title': 'MIb 1 Omen de PRETO',
            'vote_average': 9.0,
            'overview': 'Filme de alienigena',
            'poster_path': '/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg',
            'backdrop_path': '/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg',
            'genres': [
              {'id': 1, 'name': 'Drama'},
            ],
          },
        )
      ];

      sut.getMostPopularMovies();

      expect(sut.mostPopularMoviesCarouselViewModels, isNotEmpty);
    },
  );

  test('Test didTapMovie expect invoke onTapMovie block', () {
    var invokedOnTapMovie = 0;
    sut.onTapMovie = (int movieId) {
      invokedOnTapMovie += 1;
    };

    sut.didTapMovie(movieId: 10);

    expect(invokedOnTapMovie, 1);
  });

  test('Test didTapMovie expect receivedMovieId is the same of movieId', () {
    var receiveMovieId = 0;
    sut.onTapMovie = (int movieId) {
      receiveMovieId += movieId;
    };

    sut.didTapMovie(movieId: 16);

    expect(receiveMovieId, 16);
  });
}
