import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../api/database/dao/favorite_dao.dart';
import '../../../support/helpers/server_errors.dart';
import '../../models/movie_details.dart';

typedef Success = void Function(String movieResponse);
typedef Failure = void Function(ServerError error);

abstract class RemoveMovieFavoriteUseCaseProtocol {
  void execute({Success? success, Failure? failure, required MovieDetail movie});
}

class RemoveMovieFavoriteUseCase extends RemoveMovieFavoriteUseCaseProtocol {
  final Localization l10n;
  final FavoriteDaoProtocol dao;

  RemoveMovieFavoriteUseCase({
    Success? success,
    Failure? failure,
    required this.dao,
    required this.l10n,
  });

  @override
  void execute({Success? success, Failure? failure, required MovieDetail movie}) {
    try {
      dao.removeMovieFavorite(movieId: movie.id).whenComplete(() {
        success?.call('Filme removido dos favoritos com sucesso!');
      });
    } on Error catch (error) {
      failure?.call(error.internalError());
    }
  }
}
