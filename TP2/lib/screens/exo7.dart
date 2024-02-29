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
  String imageUrl = 'https://picsum.photos/512';

  @override
  void initState() {
    super.initState();
    _initializeTiles();
  }

  void _initializeTiles() {
  // Générez une configuration gagnante
  tiles = List<int?>.generate(9, (index) => index + 1)..[8] = null;
  
  // Effectuez un certain nombre d'échanges aléatoires
  for (int i = 0; i < 100; i++) {
    int randomIndex1 = random.nextInt(9);
    int randomIndex2 = random.nextInt(9);

    // Échangez les valeurs des deux indices
    int? temp = tiles[randomIndex1];
    tiles[randomIndex1] = tiles[randomIndex2];
    tiles[randomIndex2] = temp;
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 7'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: tiles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _swapTiles(index);
                  },
                  
                  child: ImageTile(
                    imageUrl: imageUrl,
                    tileNumber: tiles[index],
                  ),
                );
              },
            ),
          ),
          if (_isWinner()) // Affiche "C'est gagné !!" si la condition de victoire est remplie
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "C'est gagné !!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
        ],
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

          if (_isWinner()) {
            // Si c'est gagné, affiche un message
            // ignore: inference_failure_on_function_invocation
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Félicitations !"),
                content: Text("C'est gagné !!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _initializeTiles(); // Redémarrer le jeu après la victoire
                    },
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          }

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

  bool _isWinner() {
    for (int i = 0; i < tiles.length; i++) {
      if (tiles[i] != null && tiles[i] != i + 1) {
        return false;
      }
    }
    return true;
  }
}

class ImageTile extends StatelessWidget {
  final String imageUrl;
  final int? tileNumber;

  ImageTile({
    required this.imageUrl,
    required this.tileNumber,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3),
          ),
          child: Center(
            child: tileNumber != null
                ? Image.network(imageUrl) // Remplacez cela par le widget Image approprié pour votre logique
                : SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
