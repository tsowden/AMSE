import 'package:flutter/material.dart';

class Exo1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exo 1 : afficher une image'),
      ),
      // SingleChildScrollView = permet défilement si image plus grande que l'écran
      body: SingleChildScrollView(
        child: Center(
          child: Image.network(
            'https://picsum.photos/512/1024',
            key: UniqueKey(), // clé unique pour reconstruire le widget à chaque fois et avoir une nouvelle image random
            fit: BoxFit.cover,

          ),
        ),
      ),
    );
  }
}
