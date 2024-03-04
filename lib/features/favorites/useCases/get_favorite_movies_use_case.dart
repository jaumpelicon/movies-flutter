import '../../../api/database/dao/favorite_dao.dart';
import '../../../support/helpers/server_errors.dart';
import '../../models/movie_favorite.dart';

typedef Success = void Function(List<MovieFavorite> movies);
typedef Failure = void Function(ServerError error);

abstract class GetFavoritesUseCaseProtocol {
  void execute({Success? success, Failure? failure});
}

class GetFavoritesUseCase extends GetFavoritesUseCaseProtocol {
  final FavoriteDaoProtocol dao;

  GetFavoritesUseCase({Success? success, Failure? failure, required this.dao});

  @override
  void execute({Success? success, Failure? failure}) {
    try {
      dao.getFavorites().then((movies) {
        success?.call(movies);
      });
    } on Error catch (error) {
      failure?.call(error.internalError());
    }
  }
}
