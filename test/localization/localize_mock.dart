import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:jeraflix_pelicom/localization/localize.dart';

import 'localization_mock.dart';

class LocalizeMock extends LocalizeProtocol {
  static LocalizeMock instance = LocalizeMock._();
  LocalizeMock._();

  @override
  Localization get l10n => LocalizationMock();
}
