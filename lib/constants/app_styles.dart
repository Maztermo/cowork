import 'package:cowork/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle style1 = GoogleFonts.inter(fontSize: 88);
  static TextStyle style1White =
      GoogleFonts.inter(fontSize: 88, color: Colors.white);
  static TextStyle style1WhiteBold = GoogleFonts.inter(
      fontSize: 88, color: Colors.white, fontWeight: FontWeight.bold);
  static TextStyle style2 = GoogleFonts.inter(fontSize: 44);
  static TextStyle style2darkGreen =
      GoogleFonts.inter(fontSize: 44, color: AppColors.darkGreen);
  static TextStyle style2White =
      GoogleFonts.inter(fontSize: 44, color: Colors.white);
  static TextStyle style3 = GoogleFonts.inter(fontSize: 32);
  static TextStyle style3darkGreen =
      GoogleFonts.inter(fontSize: 32, color: AppColors.darkGreen);
  static TextStyle style3Orange = GoogleFonts.inter(
      fontSize: 32,
      color: const Color(0xFFBA8446),
      fontStyle: FontStyle.italic);
  static TextStyle style3White =
      GoogleFonts.inter(fontSize: 32, color: Colors.white);
  static TextStyle style3WhiteThin = GoogleFonts.inter(
      fontSize: 32, color: Colors.white, fontWeight: FontWeight.w200);
  static TextStyle style4 = GoogleFonts.inter(fontSize: 24);
  static TextStyle style4darkGreen =
      GoogleFonts.inter(fontSize: 24, color: AppColors.darkGreen);
  static TextStyle style4White =
      GoogleFonts.inter(fontSize: 24, color: Colors.white);
  static TextStyle style5 = GoogleFonts.inter(fontSize: 18);
  static TextStyle style5White =
      GoogleFonts.inter(fontSize: 18, color: Colors.white);
  static TextStyle style5WhiteThin = GoogleFonts.inter(
      fontSize: 18, color: Colors.white, fontWeight: FontWeight.w200);
  static TextStyle style5WhiteGreen =
      GoogleFonts.inter(fontSize: 18, color: AppColors.whiteGreen);
  static TextStyle style5DarkGreen =
      GoogleFonts.inter(fontSize: 18, color: AppColors.darkGreen);
  static TextStyle style6 = GoogleFonts.inter(fontSize: 12);
  static TextStyle style6White =
      GoogleFonts.inter(fontSize: 12, color: Colors.white);
}
