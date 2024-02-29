import 'package:flutter/material.dart';
import 'package:testing_app/screens/exo6.dart';
import 'screens/exo1.dart'; 
import 'screens/exo2.dart'; 
import 'screens/exo2b.dart'; 
import 'screens/exo4.dart'; 
import 'screens/exo5a.dart'; 
import 'screens/exo5b.dart'; 
import 'screens/exo6b.dart'; 
import 'screens/exo5c.dart'; 
import 'screens/exo7.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TP2'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Exercice 1'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Exo1Screen()));
            },
          ),
          ListTile(
            title: const Text('Exercice 2'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Exo2Screen()));
            },
          ),
          ListTile(
            title: const Text('Exercice 2b'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Exo2bScreen()));
            },
          ),
          ListTile(
            title: const Text('Exercice 4'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DisplayTileWidget()));
            },
          ),
          ListTile(
            title: const Text('Exercice 5a'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GridViewExample()));
            },
          ),

        ListTile(
          title: const Text('Exercice 5b'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ImageGrid(imageUrl: 'assets/imgs/basile_carre.png'),
            ));
          },
        ),
  
          ListTile(
            title: const Text('Exercice 5c'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DynamicGridScreen()),
              );
            },
          ),

          ListTile(
            title: const Text('Exercice 6'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => PositionedTiles()));
            },
          ),

          ListTile(
            title: const Text('Exercice 6b'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Exo6bScreen()));
            },
          ),

          ListTile(
            title: const Text('Exercice 7'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Exo7Screen()));
            },
          ),
          

        ],
      ),
    );
  }
}
