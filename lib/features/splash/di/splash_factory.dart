import 'package:flutter/material.dart';

import '../splash_view_controler.dart';
import '../splash_view_model.dart';

class SplashFactory {
  static const String route = '/splash';
  
  static StatefulWidget splash() {
    final viewModel = SplashViewModel();

    return SplashViewController(viewModel: viewModel);
  }
}
