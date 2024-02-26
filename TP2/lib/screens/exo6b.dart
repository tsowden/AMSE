import 'dart:math' as math;

import 'package:flutter/material.dart';

math.Random random = math.Random();

class Exo6bScreen extends StatefulWidget {
  const Exo6bScreen({Key? key}) : super(key: key);

  @override
  _Exo6bScreenState createState() => _Exo6bScreenState();
}

class _Exo6bScreenState extends State<Exo6bScreen> {
  late List<int?> tiles;

  @override
  void initState() {
    super.initState();
    _initializeTiles();
  }

  void _initializeTiles() {
    tiles = List.generate(9, (index) => index + 1);
    // Supprimez une tuile aléatoire de la liste en la rendant null
    tiles[random.nextInt(tiles.length)] = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 6b'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: tiles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _swapTiles(index);
            },
            child: Container(
              decoration: BoxDecoration(
                color: tiles[index] != null
                    ? Colors.primaries[tiles[index]! % Colors.primaries.length]
                    : Colors.grey[300],
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: Center(
                child: tiles[index] != null
                    ? Text(
                        'Tile ${tiles[index]}',
                        style: const TextStyle(fontSize: 24, color: Colors.white),
                      )
                    : SizedBox.shrink(),
              ),
            ),
          );
        },
      ),
    );
  }

  void _swapTiles(int tappedIndex) {
  if (tiles[tappedIndex] != null) {
    // Si la tuile cliquée n'est pas vide, recherchez la case vide adjacente
    List<int> adjacentIndices = getAdjacentIndices(tappedIndex);
    for (int adjacentIndex in adjacentIndices) {
      if (tiles[adjacentIndex] == null) {
        // Échangez la tuile cliquée avec la case vide adjacente
        setState(() {
          tiles[adjacentIndex] = tiles[tappedIndex];
          tiles[tappedIndex] = null;
        });
        break;
      }
    }
  }
}


  List<int> getAdjacentIndices(int index) {
    int row = index ~/ 3;
    int col = index % 3;

    List<int> adjacentIndices = [];

    if (row > 0) adjacentIndices.add(index - 3);
    if (row < 2) adjacentIndices.add(index + 3);
    if (col > 0) adjacentIndices.add(index - 1);
    if (col < 2) adjacentIndices.add(index + 1);

    return adjacentIndices;
  }
}

