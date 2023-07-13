import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 33.0;

Color primaryColor = const Color(0xff2B637B);
Color secondaryColor = const Color(0xffC2DEDC);
Color alertColor = const Color(0xffED6363);

// Mostly semua halaman pake background color ini
Color backgroundColor1 = const Color(0xffFFFFFF);
// Dipake di homepage penjahit dan chat (?)
Color backgroundColor2 = const Color(0xffF5F5F5);

Color primaryTextColor = const Color(0xff03001C);
Color subtitleTextColor = const Color(0xffE9E8E8);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
);

TextStyle subtitleTextStyle = GoogleFonts.poppins(
  color: subtitleTextColor,
);

TextStyle secondaryTextStyle = GoogleFonts.poppins(
  color: secondaryColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: backgroundColor1,
);

FontWeight light = FontWeight.w300;
FontWeight reguler = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
