import 'dart:math' as math;
import 'package:flutter/material.dart';

math.Random random = math.Random();

class Exo7Screen extends StatefulWidget {
  const Exo7Screen({super.key});

  @override
  _Exo7ScreenState createState() => _Exo7ScreenState();
}

class _Exo7ScreenState extends State<Exo7Screen> {
  late List<Tile> tiles;
  final String imageUrl = 'https://picsum.photos/512';
  int _score = 0;
  bool _showOriginalImage = false;
  bool _showTchoupi = false;
  List<String> phrases = [
  "Pas très bien joué, dommage.",
  "D'ici 200 ou 300 coups, tu vas y arriver.",
  "J'aurais pas fait ça personnellement.",
  "Aie aie aie",
  "Concentre toi un peu !",
  "T'essayes, c'est le plus important.",
  "...",
  "Bien joué !! ^^'",




];

  String _currentPhrase = "";

  @override
  void initState() {
    super.initState();
    _initializeTiles();
    _score = 0;
    _selectRandomPhrase();
  }

  void _selectRandomPhrase() {
    setState(() {
      _currentPhrase = phrases[random.nextInt(phrases.length)];
    });
  }
  void _initializeTiles() {
    List<Alignment> alignments = [
      Alignment(-1.0, -1.0), Alignment(0.0, -1.0), Alignment(1.0, -1.0),
      Alignment(-1.0, 0.0), Alignment(0.0, 0.0), Alignment(1.0, 0.0),
      Alignment(-1.0, 1.0), Alignment(0.0, 1.0), Alignment(1.0, 1.0),
    ];

    tiles = List<Tile>.generate(9, (index) => Tile(index, alignments[index]));
    tiles[8] = Tile(null, alignments[8]);

    for (int i = 0; i < 100; i++) {
      int randomIndex1 = random.nextInt(9);
      int randomIndex2 = random.nextInt(9);

      Tile temp = tiles[randomIndex1];
      tiles[randomIndex1] = tiles[randomIndex2];
      tiles[randomIndex2] = temp;
    }
  }

  void _swapTiles(int tappedIndex) {
    int? emptyTileIndex = tiles.indexWhere((tile) => tile.id == null);
    if (getAdjacentIndices(tappedIndex).contains(emptyTileIndex)) {
      setState(() {
        Tile temp = tiles[tappedIndex];
        tiles[tappedIndex] = tiles[emptyTileIndex];
        tiles[emptyTileIndex] = temp;
        _score++;
        _selectRandomPhrase();
      });
      if (_isWinner()) {
        _showVictoryDialog();
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
      if (tiles[i].id != null && tiles[i].id != i) {
        return false;
      }
    }
    return true;
  }

  void _showVictoryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Félicitations !"),
          content: Text("Vous avez réussi à reconstituer l'image !"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                _initializeTiles();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 7'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Score: $_score', style: TextStyle(fontSize: 24)),
          ),
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
                    tile: tiles[index],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _showTchoupi = !_showTchoupi;
              });
            },
            child: Text("Afficher T'choupi"),
          ),
          if (_showTchoupi)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DialogueBubble(text: _currentPhrase),
                SizedBox(width: 10), 
                Image.asset(
                  'assets/imgs/Tchoup.png',
                  width: 80,
                  height: 80,
                ),
              ],
            ),




          ElevatedButton(
            onPressed: () {
              setState(() {
                _showOriginalImage = !_showOriginalImage;
              });
            },
            child: Text(_showOriginalImage ? "Cacher l'image originale" : "Voir l'image originale"),
          ),
          if (_showOriginalImage)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class DialogueBubble extends StatelessWidget {
  final String text;

  DialogueBubble({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class Tile {
  final int? id;
  final Alignment alignment;

  Tile(this.id, this.alignment);
}

class ImageTile extends StatelessWidget {
  final String imageUrl;
  final Tile tile;

  ImageTile({
    required this.imageUrl,
    required this.tile,
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
          child: Align(
            alignment: tile.alignment,
            widthFactor: 1 / 3,
            heightFactor: 1 / 3,
            child: tile.id != null ? Image.network(imageUrl) : SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
