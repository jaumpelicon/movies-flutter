import 'package:flutter/material.dart';

import '../../styles/application_colors.dart';

class LoadingPlaceholder extends StatelessWidget {
  const LoadingPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Center(
              child: CircularProgressIndicator(
                color: ApplicationColors.green,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
