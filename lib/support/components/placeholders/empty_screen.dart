import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../styles/application_images.dart';
import '../../styles/application_typography.dart';

class EmptyPlaceholder extends StatelessWidget {
  final String title;
  final String description;
  const EmptyPlaceholder({required this.title, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 16),
              child: Text(
                title,
                style: ApplicationTypography.nunitoSemiBoldWhite(20),
              ),
            ),
            const Spacer(flex: 2),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 200),
                child: Lottie.asset(
                  AppImage.errorScreenAnimation,
                  animate: true,
                  repeat: true,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Text(
                description,
                textAlign: TextAlign.center,
                maxLines: 3,
                style: ApplicationTypography.montserratSemiBoldWhite(14),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
