import 'package:flutter/src/widgets/framework.dart';

import 'policy_terms_view.dart';

abstract class PolicyTermsProtocol extends PolicyTermsViewModelProtocol {
  void loadContent();
}

class PolicyTermsViewController extends StatefulWidget {
  final PolicyTermsProtocol viewModel;
  const PolicyTermsViewController({super.key, required this.viewModel});

  @override
  State<PolicyTermsViewController> createState() => _PolicyTermsViewControllerState();
}

class _PolicyTermsViewControllerState extends State<PolicyTermsViewController> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.loadContent();
  }

  @override
  Widget build(BuildContext context) {
    return PolicyTermsView(viewModel: widget.viewModel);
  }
}
