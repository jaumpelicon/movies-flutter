import 'package:flutter/material.dart';

import '../../styles/application_colors.dart';
import '../../styles/application_typography.dart';
import 'movie_item.dart';

class MovieWhiteItemView extends StatelessWidget {
  final MovieItemViewModelProtocol viewModel;

  const MovieWhiteItemView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6)),
                child: Image.network(
                  viewModel.moviePosterImg,
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: ApplicationColors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(6), bottomRight: Radius.circular(6)),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 8, left: 8),
                          child: Text(
                            viewModel.movieTitle,
                            style: ApplicationTypography.nunitoBoldBlack(14),
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // Padding(
                        //     padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                        //     child: _suggestedMovieDetailsText(viewModel.releaseDate)),
                        // Padding(
                        //     padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                        //     child: _suggestedMovieDetailsText(viewModel.voteCount)),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 8, left: 8),
                        //   child: Text(
                        //     viewModel.movieDate,
                        //     style: ApplicationTypography.nunitoBoldBlack(12),
                        //     maxLines: 1,
                        //     textAlign: TextAlign.start,
                        //     overflow: TextOverflow.ellipsis,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12, right: 8, left: 8),
                          child: Container(
                            width: 80,
                            height: 28,
                            decoration: BoxDecoration(
                              color: ApplicationColors.green1,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              viewModel.movieRate,
                              style: ApplicationTypography.nunitoSemiBoldWhite(
                                12,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
