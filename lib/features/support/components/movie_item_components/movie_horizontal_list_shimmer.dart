import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../localization/localize.dart';
import '../../styles/application_colors.dart';
import '../../styles/application_typography.dart';

class MovieHorizontalListShimmer extends StatelessWidget {
  const MovieHorizontalListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 280,
      ),
      child: SizedBox(
        height: 280,
        child: ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 154),
                child: SizedBox(
                  width: 280,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Shimmer.fromColors(
                                baseColor: ApplicationColors.white,
                                highlightColor: ApplicationColors.gray,
                                child: Container(
                                  width: 280,
                                  color: ApplicationColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Shimmer.fromColors(
                        baseColor: ApplicationColors.white,
                        highlightColor: ApplicationColors.gray,
                        child: Text(
                          l10n.yourMovieShimmerTitle,
                          style: ApplicationTypography.montserratSemiBoldWhite(12),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
