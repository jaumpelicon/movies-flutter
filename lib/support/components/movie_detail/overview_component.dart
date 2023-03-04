import 'package:flutter/material.dart';

import '../../../localization/localize.dart';
import '../../styles/application_colors.dart';
import '../../styles/application_typography.dart';

class OverviewCard extends StatelessWidget {
  final String overview;

  const OverviewCard({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //TODO REMOVE AND CHANGE FOR TABLAYOUT
              Text(
                l10n.overviewTitle,
                style: ApplicationTypography.montserratSemiBoldWhite(16),
              ),
              const SizedBox(height: 12),
              Container(
                height: 4,
                width: 24,
                decoration: BoxDecoration(
                  color: ApplicationColors.green1,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: ApplicationColors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Text(
                      overview,
                      style: ApplicationTypography.nunitoSemiBoldWhite(16),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
