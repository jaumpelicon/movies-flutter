import 'package:flutter/material.dart';

import 'navigation_view.dart';

abstract class NavigationProtocol extends NavigationViewModelProtocol {}

class NavigationViewController extends StatefulWidget {
  final NavigationProtocol viewModel;

  const NavigationViewController({super.key, required this.viewModel});

  @override
  State<NavigationViewController> createState() => _NavigationViewControllerState();
}

class _NavigationViewControllerState extends State<NavigationViewController> {
  @override
  Widget build(BuildContext context) {
    return NavigationView(viewModel: widget.viewModel);
  }
}
