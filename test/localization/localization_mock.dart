import 'package:flutter_gen/gen_l10n/localization.dart';

class LocalizationMock extends Localization {
  LocalizationMock([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Jeraflix';

  @override
  String get homeTabBottomInputTitle => 'Inicial';

  @override
  String get searchTabBottomInputTitle => 'Busca';

  @override
  String get favoriteTabBottomInputTitle => 'Favoritos';

  @override
  String get knowMoreInputTitle => 'Saiba mais';

  @override
  String get criticallyAcclaimedTitle => 'Aclamados pela crítica';

  @override
  String movieRatingItemTitleLabel(Object rating) {
    return 'IMDb $rating';
  }

  @override
  String get mappingFailureError => 'Algo deu errado, estamos trabalhando nisso!';

  @override
  String get requestError => 'Aconteceu um erro inesperado, estamos trabalhando nisso!';

  @override
  String get timeoutError => 'O tempo de requisição esgotou, tente novamente mais tarde.';

  @override
  String get yourMovieShimmerTitle => 'Seu filme';

  @override
  String get errorScreenTitle => 'Algo deu errado!';

  @override
  String get checkYourConnectionMessage => 'Cheque sua conexão!';

  @override
  String get tryAgainMessage => 'E tente novamente ao atualizar a tela';

  @override
  String get releaseDateTitle => 'Data de lançamento:';

  @override
  String get overviewTitle => 'Sinopse';

  @override
  String get searchMovieInputTitle => 'Pesquisar filme';

  @override
  String get trySearchMovieHintLabel => 'Tente buscar por um filme';

  @override
  String get favoriteMoviesTitle => 'Favoritos:';

  @override
  String get successAddFavoriteMessage => 'Filme adicionado com sucesso !';

  @override
  String get overviewUnavailableTitle => 'Sinopse indisponível !';

  @override
  String get unavailableMovieTitle => 'Titulo indisponível !';

  @override
  String get emptyFavoritesMessage => 'Nenhum filme nos favorites foi encontrado :c';
}
