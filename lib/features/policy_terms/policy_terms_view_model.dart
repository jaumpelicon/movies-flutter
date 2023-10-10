import 'package:webview_flutter/webview_flutter.dart';

import 'policy_terms_view_controller.dart';

class PolicyTermsViewModel extends PolicyTermsProtocol {
  late WebViewController _controller;

  @override
  WebViewController get controller => _controller;
  @override
  void loadContent() {
    _controller = WebViewController()
      ..loadRequest(Uri.parse(
          'https://docs.google.com/document/d/e/2PACX-1vRBO2mdLHlPDaHEQb-y-mVTGCCKVd67z9SSUeopLAfdM5lScgsi2g7vOoITsUZ94ZdUGwQxQGqx_WHi/pub'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) {
            notifyListeners();
          },
        ),
      );
  }
}
