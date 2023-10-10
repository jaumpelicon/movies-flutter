
import 'package:flutter/material.dart';

import '../policy_terms_view_controller.dart';
import '../policy_terms_view_model.dart';

class PolicyTermsFactory {
  static const String policyTermsRoute = '/policy_terms_route';

  static StatefulWidget policyTerms() {
    final viewModel = PolicyTermsViewModel();
    return PolicyTermsViewController(viewModel: viewModel);
  }
}
