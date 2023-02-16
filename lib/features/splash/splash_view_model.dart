import 'package:lottie/src/composition.dart';

import '../../api/database/database_provider.dart';
import 'splash_view_controler.dart';

class SplashViewModel extends SplashProtocol {
  @override
  void onLoaded(LottieComposition composition) {
    final databaseProvider = DatabaseProvider.instance;
    databaseProvider.initialize().whenComplete(() => onNavigate?.call());
  }
}
