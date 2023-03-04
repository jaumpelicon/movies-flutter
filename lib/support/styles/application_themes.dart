import 'package:flutter/material.dart';

import 'application_colors.dart';

class ApplicationThemes {
  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: ApplicationColors.black1,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      selectedItemColor: ApplicationColors.green,
      backgroundColor: ApplicationColors.black1,
      unselectedItemColor: ApplicationColors.gray,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ApplicationColors.green1,
      ),
    ),
  );
}
