import 'package:flutter/material.dart';

import '../navigation_view_controler.dart';
import '../navigation_view_model.dart';

class NavigationFactory {
  static const String route = '/navigation';
  static StatefulWidget navigation() {
    final viewModel = NavigationViewModel();
    return NavigationViewController(viewModel: viewModel);
  }
}
