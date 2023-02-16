import 'package:flutter/material.dart';

import '../navigation/di/navigation_factory.dart';
import 'splash_view.dart';

abstract class SplashProtocol extends SplashViewModelProtocol {
  void Function()? onNavigate;
}

class SplashViewController extends StatefulWidget {
  final SplashProtocol viewModel;

  const SplashViewController({super.key, required this.viewModel});

  @override
  State<SplashViewController> createState() => _SplashViewControllerState();
}

class _SplashViewControllerState extends State<SplashViewController>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return SplashView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onNavigate = () {
      Navigator.pushReplacementNamed(context, NavigationFactory.route);
    };
  }
}
