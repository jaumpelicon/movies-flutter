import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../localization/localize.dart';
import '../../styles/application_images.dart';
import '../../styles/application_typography.dart';

class ErrorPlaceholder extends StatelessWidget {
  const ErrorPlaceholder({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 100),
          child: Lottie.asset(
            AppImage.swipeRefreshTutorialAnimation,
            animate: true,
            repeat: true,
          ),
        ),
        Center(
          child: Text(
            l10n.errorScreenTitle,
            style: ApplicationTypography.montserratSemiBoldWhite(24),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 320),
          child: Lottie.asset(
            AppImage.errorScreenAnimation,
            animate: true,
            repeat: true,
          ),
        ),
        const SizedBox(height: 32),
        Center(
          child: Text(
            l10n.checkYourConnectionMessage,
            style: ApplicationTypography.montserratSemiBoldWhite(24),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            l10n.tryAgainMessage,
            style: ApplicationTypography.montserratSemiBoldWhite(16),
          ),
        ),
      ],
    );
  }
}
