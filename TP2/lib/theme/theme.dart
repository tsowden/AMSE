import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color.fromARGB(255, 24, 27, 39), // Dark background color
      scaffoldBackgroundColor: const Color.fromARGB(255, 24, 27, 39),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(0, 24, 27, 39), // Transparent AppBar
        titleTextStyle: TextStyle(color: Color.fromARGB(255, 188, 162, 199), fontSize: 20),
        elevation: 0, // No shadow
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(201, 149, 0, 255), // Vibrant purple button
          onPrimary: const Color.fromARGB(255, 229, 213, 236), // Text color
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
        ),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 158, 20, 216)), // For large titles
        headline6: TextStyle(fontSize: 36.0, color: Color.fromARGB(255, 188, 162, 199)), // For subtitles
        bodyText2: TextStyle(fontSize: 14.0, color: Colors.white), // For body text
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color.fromARGB(201, 149, 0, 255), // Buttons
      ),
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 188, 162, 199),
      ),
      // Add additional theming as needed...
    );
  }
}
