import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/application_colors.dart';
import '../../styles/application_images.dart';
import '../../styles/application_typography.dart';

class EmptyPlaceholder extends StatelessWidget {
  final String description;
  const EmptyPlaceholder({required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 2),
            Center(
              child: SizedBox.square(
                dimension: 52,
                child: SvgPicture.asset(
                  AppImage.icEmpty,
                  color: ApplicationColors.green,
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
