import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  CustomTheme();
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: const ColorScheme(
        background: Colors.white,
        brightness: Brightness.light,
        primary: Color.fromARGB(255, 107, 38, 240),
        onPrimary: Colors.white,
        secondary: Colors.indigo,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.pink,
        onBackground: Colors.green,
        surface: Colors.black,
        onSurface: Colors.grey,
      ),
      fontFamily: GoogleFonts.poppins().fontFamily,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
