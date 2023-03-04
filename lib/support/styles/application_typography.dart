import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'application_colors.dart';

class ApplicationTypography {
  static TextStyle nunitoBoldBlack(double fontSize) {
    return GoogleFonts.nunito(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: ApplicationColors.black1,
    );
  }

  static TextStyle montserratSemiBoldWhite(double fontSize) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: ApplicationColors.white,
    );
  }

  static TextStyle nunitoSemiBoldWhite(double fontSize) {
    return GoogleFonts.nunito(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: ApplicationColors.white,
    );
  }
}
