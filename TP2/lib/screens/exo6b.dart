import 'dart:math' as math;

import 'package:flutter/material.dart';

math.Random random = math.Random();

class Exo6bScreen extends StatelessWidget {
  const Exo6bScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // Générez une liste de 9 éléments
    List<int?> tiles = List.generate(9, (index) => index + 1);

    // Supprimez une tuile aléatoire de la liste en la rendant null
    tiles[random.nextInt(tiles.length)] = null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 6b'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: tiles.map((index) {
          return Container(
            decoration: BoxDecoration(
              color: index != null
                  ? Colors.primaries[index % Colors.primaries.length]
                  : Colors.grey[300], // Couleur gris clair pour la tuile vide
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: Center(
              child: index != null
                  ? Text(
                      'Tile $index',
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    )
                  : SizedBox.shrink(), // Afficher une tuile vide
            ),
          );
        }).toList(),
      ),
    );
  }
}

