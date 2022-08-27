import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appstyle {
  //App Colors
  static Color mainColor = Color(0xff1C3879);
  static Color bgColor = Color(0xffF9F5EB);
  static Color accentColor = Color(0xff607EAA);

  // Card Colors
  static List<Color> cardColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.purple.shade100,
    Colors.grey.shade100,
    Colors.lime.shade100,
    Colors.blueGrey.shade100,
  ];

  //text style
  static TextStyle maintitle = GoogleFonts.roboto(
    fontSize: 21.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle mainContent = GoogleFonts.nunito(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle dateTitle = GoogleFonts.nunito(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
  );
}
