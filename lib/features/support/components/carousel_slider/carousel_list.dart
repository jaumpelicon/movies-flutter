import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'carousel_item.dart';

class CarouselList extends StatelessWidget {
  final List<CarouselMovieItemViewModelProtocol> viewModels;

  const CarouselList({super.key, required this.viewModels});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        autoPlay: true,
      ),
      items: viewModels.map((viewModel) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: MovieCarouselItem(
                viewModel: viewModel,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
