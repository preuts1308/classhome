import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildThemeData(){
  return ThemeData(
    textTheme: TextTheme(
      titleLarge: GoogleFonts.pacifico(),
      bodyMedium: GoogleFonts.lato()
    )
  );
}

TextStyle styleTextTitle(BuildContext context, double fontSize){
  return Theme.of(context).textTheme.titleLarge!.copyWith(
    fontSize: fontSize,
    fontWeight: FontWeight.w800,
    color: Colors.deepOrange
  );
}