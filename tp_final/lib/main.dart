import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/jouer_page.dart'; // Import JouerPage
import 'screens/meilleurs_scores_page.dart'; // Import MeilleursScoresPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jeu de Taquin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/jouer': (context) => JouerPage(), // Use JouerPage here
        '/meilleurs_scores': (context) => MeilleursScoresPage(), // Use MeilleursScoresPage here
      },
    );
  }
}
