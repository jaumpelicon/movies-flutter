import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../support/styles/application_images.dart';

abstract class SplashViewModelProtocol with ChangeNotifier {
  void onLoaded(LottieComposition composition);
}

class SplashView extends StatelessWidget {
  final SplashViewModelProtocol viewModel;
  
  const SplashView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AppImage.splashAnimation,
          animate: true,
          onLoaded: viewModel.onLoaded,
        ),
      ),
    );
  }
}
