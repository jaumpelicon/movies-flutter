import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

abstract class PolicyTermsViewModelProtocol extends ChangeNotifier {
  WebViewController get controller;
}

class PolicyTermsView extends StatelessWidget {
  final PolicyTermsViewModelProtocol viewModel;

  const PolicyTermsView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Políticas de Privacidade e Termos'),
      ),
      body: SafeArea(
        child: ListenableBuilder(
            listenable: viewModel,
            builder: (_, __) {
              return Expanded(
                child: WebViewWidget(controller: viewModel.controller),
              );
            }),
      ),
    );
  }
}
