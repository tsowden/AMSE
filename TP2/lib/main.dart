import 'package:flutter/material.dart';
import 'screens/exo1.dart'; 
import 'screens/exo2.dart'; 
import 'screens/exo2b.dart'; 
import 'screens/exo4.dart'; 




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TP2'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Exercice 1'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Exo1Screen()));
            },
          ),
          ListTile(
            title: Text('Exercice 2'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Exo2Screen()));
            },
          ),
          ListTile(
            title: Text('Exercice 2b'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Exo2bScreen()));
            },
          ),
          ListTile(
            title: Text('Exercice 4'),
            onTap: () {
              
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Exo4Screen()));
            },
          ),
        ],
      ),
    );
  }
}
