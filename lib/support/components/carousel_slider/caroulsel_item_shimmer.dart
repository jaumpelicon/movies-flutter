import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../styles/application_colors.dart';

class MovieCarouselShimmerItem extends StatelessWidget {
  const MovieCarouselShimmerItem({super.key});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        autoPlay: true,
      ),
      items: [
        _shimmerItemWidget(),
        _shimmerItemWidget(),
        _shimmerItemWidget(),
      ],
    );
  }
}

Widget _shimmerItemWidget() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 12),
    child: Center(
      child: Shimmer.fromColors(
        baseColor: ApplicationColors.white,
        highlightColor: ApplicationColors.gray,
        child: Container(
          width: 272.0,
          height: 400.0,
          color: ApplicationColors.white,
        ),
      ),
    ),
  );
}
