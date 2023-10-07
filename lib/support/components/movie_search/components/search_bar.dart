import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../extension/debouncer.dart';
import '../../../styles/application_colors.dart';
import '../../../styles/application_typography.dart';

class CustomSearchBar extends StatelessWidget {
  final Localization l10n;
  final void Function(String query) getSearchMovies;

  const CustomSearchBar({
    super.key,
    required this.l10n,
    required this.getSearchMovies,
  });

  @override
  Widget build(BuildContext context) {
    final debouncer = Debouncer(seconds: 1);
    final result = TextField(
      onChanged: (value) {
        debouncer.run(() {
          getSearchMovies.call(value);
        });
      },
      onSubmitted: getSearchMovies,
      style: ApplicationTypography.nunitoBoldBlack(16),
      decoration: InputDecoration(
        isDense: true,
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        hintText: l10n.searchMovieInputTitle,
        hintStyle: ApplicationTypography.nunitoBoldBlack(16),
      ),
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: ApplicationColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          const Icon(Icons.search),
          const SizedBox(width: 12),
          Expanded(child: result),
        ],
      ),
    );
  }
}
