import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorBase {
  static final primary = Color(0xFFFF7600);
  static final blue = Color(0xFF0176E8);
}

String iconsPath = 'assets/icons/';

TextStyle fontBlack = GoogleFonts.roboto(
  color: Colors.black,
  fontSize: 15,
);

TextStyle font2Black =
    GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.w300);

TextStyle fontWhite = GoogleFonts.roboto(
  color: Colors.white,
  fontSize: 15,
);

//* Device size
double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Color colorStatus(String status) {
  if (status == 'success') {
    return Colors.green;
  } else if (status == 'process') {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}
