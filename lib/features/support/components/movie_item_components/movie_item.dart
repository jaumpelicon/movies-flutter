import 'package:flutter/material.dart';

import '../../styles/application_colors.dart';
import '../../styles/application_typography.dart';

abstract class MovieItemViewModelProtocol {
  int get movieId;
  String get movieRate;
  bool get showRate;
  String get movieTitle;
  String get moviePosterImg;

  void didTapMovie(int movieId);
}

class MovieItemView extends StatelessWidget {
  final MovieItemViewModelProtocol viewModel;

  const MovieItemView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: InkWell(
                  onTap: () {
                    viewModel.didTapMovie(viewModel.movieId);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(
                      viewModel.moviePosterImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 8,
                bottom: 8,
                child: Container(
                  width: 80,
                  height: 32,
                  padding: const EdgeInsets.all(4.0),
                  alignment: Alignment.bottomRight,
                  child: Visibility(
                    visible: viewModel.showRate,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ApplicationColors.green1,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        viewModel.movieRate,
                        style: ApplicationTypography.nunitoSemiBoldWhite(14),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          viewModel.movieTitle,
          maxLines: 2,
          style: ApplicationTypography.montserratSemiBoldWhite(14),
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
