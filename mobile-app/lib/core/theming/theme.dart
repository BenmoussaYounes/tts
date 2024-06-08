import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme();
  static ColorScheme get colorScheme =>
      ColorScheme.fromSeed(seedColor: const Color(0xFF7C8A1B));
  static Color get backgroundColor => const Color(0xFF7C8A1B);

  static ThemeData get lightTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7C8A1B)),
        useMaterial3: true,
        fontFamily: 'Poppins',
        textTheme: GoogleFonts.poppinsTextTheme(),
      );

  static ThemeData get darkTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        fontFamily: 'Poppins',
        primaryColor: const Color(0xFF3700B3),
        primaryColorLight: const Color(0xFF6200EE),
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3700B3),
        ),
      );
}
