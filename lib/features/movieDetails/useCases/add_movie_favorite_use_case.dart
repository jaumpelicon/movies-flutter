import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../api/database/dao/favorite_dao.dart';
import '../../models/movie_details.dart';
import '../../../support/helpers/server_errors.dart';

typedef Success = void Function(String movieResponse);
typedef Failure = void Function(ServerError error);

abstract class AddMovieFavoriteUseCaseProtocol {
  void execute({Success? success, Failure? failure, required MovieDetail movie});
}

class AddMovieFavoriteUseCase extends AddMovieFavoriteUseCaseProtocol {
  final Localization l10n;
  final FavoriteDaoProtocol dao;

  AddMovieFavoriteUseCase({
    Success? success,
    Failure? failure,
    required this.dao,
    required this.l10n,
  });

  @override
  void execute({Success? success, Failure? failure, required MovieDetail movie}) {
    try {
      dao.insertMovieFavorite(movie: movie).whenComplete(() {
        success?.call(l10n.successAddFavoriteMessage);
      });
    } on Error catch (error) {
      failure?.call(error.internalError());
    }
  }
}
