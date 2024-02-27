import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    // Propriétés du thème clair
    secondaryHeaderColor: const Color.fromARGB(255, 246, 225, 36),
    primaryColor: const Color.fromRGBO(205, 16, 132, 1),
    backgroundColor: const Color.fromRGBO(126, 168, 212, 1),

//Text Theme
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, fontFamily:'Break'),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'KenyanCoffee'),
      button: TextStyle(
        color: Color.fromRGBO(205, 16, 132, 1), 
        fontSize: 24.0,
        fontFamily: 'Lato',
        fontWeight: FontWeight.bold
      ),
    ),

//Button Theme
    buttonTheme: const ButtonThemeData(
      buttonColor: Color.fromARGB(255, 246, 225, 36),
    ),

//App Bar
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
    ),

    //Champs de saisie
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color:Color.fromRGBO(205, 16, 132, 1)),
    ),

    iconTheme: IconThemeData(
      color: const Color.fromARGB(255, 255, 255, 255),
      size: 24.0,
    ),


  );

  static ThemeData darkTheme = ThemeData(
    // Définissez ici les propriétés du thème sombre
    primaryColor: Colors.indigo,
    secondaryHeaderColor: Colors.amber,
    // ...
  );
}
