import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
      ).copyWith(
        primary: const Color.fromARGB(255, 24, 27, 39),  
        onPrimary: const Color.fromARGB(255, 188, 162, 199), 
        secondary: const Color.fromARGB(201, 149, 0, 255), 
        onSecondary: const Color.fromARGB(255, 229, 213, 236), 
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 24, 27, 39),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(0, 24, 27, 39), 
        titleTextStyle: TextStyle(color: Color.fromARGB(255, 188, 162, 199), fontSize: 20),
        elevation: 0, 
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(201, 149, 0, 255), 
          foregroundColor: const Color.fromARGB(255, 229, 213, 236), 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 158, 20, 216)),
        titleLarge: TextStyle(fontSize: 36.0, color: Color.fromARGB(255, 188, 162, 199)), 
        bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white), 
      ),
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 188, 162, 199),
      ),
    );
  }
}
