import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData hackTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 24, 27, 39), // Dark Gray
    scaffoldBackgroundColor: const Color.fromARGB(255, 24, 27, 39),
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(0, 24, 27, 39),
      titleTextStyle: TextStyle(color: Color.fromARGB(255, 188, 162, 199)),
      elevation: 0, // Remove app bar shadow
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(201, 149, 0, 255), // Vibrant purple
        textStyle: const TextStyle(color: Color.fromARGB(255, 229, 213, 236), fontSize: 18.0,)
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 158, 20, 216),
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
      ),
    ),
  );
}
