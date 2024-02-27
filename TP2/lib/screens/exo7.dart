import 'dart:math' as math;
import 'package:flutter/material.dart';

math.Random random = math.Random();

class Exo7Screen extends StatefulWidget {
  const Exo7Screen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Exo7ScreenState createState() => _Exo7ScreenState();
}

class _Exo7ScreenState extends State<Exo7Screen> {
  late List<int?> tiles;

  @override
  void initState() {
    super.initState();
    _initializeTiles();
  }

  void _initializeTiles() {
    tiles = List<int?>.generate(9, (index) => index + 1)..[random.nextInt(9)] = null;
    tiles.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 7'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
      List<int> adjacentIndices = getAdjacentIndices(tappedIndex);
      for (int adjacentIndex in adjacentIndices) {
        if (tiles[adjacentIndex] == null) {
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
