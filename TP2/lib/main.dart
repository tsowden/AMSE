import 'package:flutter/material.dart';
import 'screens/exo1.dart'; 
import 'screens/exo2.dart'; 
import 'screens/exo2b.dart'; 



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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Exo1Screen()));
            },
          ),
          ListTile(
            title: const Text('Exercice 2'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Exo2Screen()));
            },
          ),
          ListTile(
            title: const Text('Exercice 2b'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Exo2bScreen()));
            },
          ),
        ],
      ),
    );
  }
}
