import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/theme.dart';

math.Random random = math.Random();

class Tile {
  final int? id;
  final Alignment alignment;

  Tile(this.id, this.alignment);
}

class ImageTile extends StatelessWidget {
  final String imageUrl;
  final Tile tile;

  const ImageTile({super.key, 
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
            child: tile.id != null ? Image.network(imageUrl) : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

class Exo7Screen extends StatefulWidget {
  const Exo7Screen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Exo7ScreenState createState() => _Exo7ScreenState();
}

class _Exo7ScreenState extends State<Exo7Screen> {
  late List<Tile> tiles;
  final String imageUrl = 'https://picsum.photos/512';
  int _score = 0;
  bool _gameStarted = false;
  bool _showOriginalImage = false; // Now will be used
  bool _showTchoupi = false; // Now will be used
  int _gridSize = 3;
  List<String> phrases = [
    "Pas très bien joué, dommage.",
    "D'ici 200 ou 300 coups, tu vas y arriver.",
    "J'aurais pas fait ça personnellement.",
    "Aie aie aie",
    "Concentre toi un peu !",
    "T'essayes, c'est le plus important.",
    "...",
    "Bien joué aha ^^'",
    "C'est ton chat qui joue ?",
    "Anthony Fleury jouait mieux...",
    "Faut arrêter de cliquer aléatoirement.",
    "C'est long, non ?",
    "Je m'ennuie.",
    "Je suis un pingouin. Tu es un manchot."
  ];

  String _currentPhrase = ""; // Now will be used

  @override
  void initState() {
    super.initState();
    _initializeTiles();
    _score = 0;
    _selectRandomPhrase();
  }

  void _startGame() {
    setState(() {
      _gameStarted = true;
      _initializeTiles();
      _score = 0; // Reset the score
    });
  }

  void _stopGame() {
    setState(() {
      _gameStarted = false;
      _score = 0;
    });
  }

  void _increaseGridSize() {
    if (_gridSize < 5) {
      setState(() {
        _gridSize++;
        _initializeTiles(); // Re-initialize the tiles for the new grid size
      });
    }
  }

  void _decreaseGridSize() {
    if (_gridSize > 3) {
      setState(() {
        _gridSize--;
        _initializeTiles(); // Re-initialize the tiles for the new grid size
      });
    }
  }

  void _selectRandomPhrase() {
    setState(() {
      _currentPhrase = phrases[random.nextInt(phrases.length)];
    });
  }

  void _initializeTiles() {
    List<Alignment> alignments = createAlignments(_gridSize);
    int tileCount = _gridSize * _gridSize;

    tiles = List<Tile>.generate(tileCount, (index) => Tile(index, alignments[index]));
    tiles[tileCount - 1] = Tile(null, alignments[tileCount - 1]);

    for (int i = 0; i < tileCount * 5; i++) {
      int randomIndex1 = random.nextInt(tileCount);
      int randomIndex2 = random.nextInt(tileCount);
      if (randomIndex1 != randomIndex2) {
        Tile temp = tiles[randomIndex1];
        tiles[randomIndex1] = tiles[randomIndex2];
        tiles[randomIndex2] = temp;
      }
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
    int gridSize = _gridSize;
    int row = index ~/ gridSize;
    int col = index % gridSize;
    List<int> adjacentIndices = [];

    if (row > 0) adjacentIndices.add(index - gridSize);
    if (row < gridSize - 1) adjacentIndices.add(index + gridSize);
    if (col > 0) adjacentIndices.add(index - 1);
    if (col < gridSize - 1) adjacentIndices.add(index + 1);

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
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Félicitations !"),
          content: const Text("Vous avez réussi à reconstituer l'image !"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _initializeTiles(); // Re-initialize the game state
              },
            ),
          ],
        );
      },
    );
  }

  List<Alignment> createAlignments(int gridSize) {
    List<Alignment> alignments = [];
    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        double x = (col * 2 / (gridSize - 1)) - 1;
        double y = (row * 2 / (gridSize - 1)) - 1;
        alignments.add(Alignment(x, y));
      }
    }
    return alignments;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
    data: AppTheme.darkTheme, // Use the dark theme defined in your theme.dart file
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 7'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _gridSize,
              ),
              itemCount: _gridSize * _gridSize,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (_gameStarted) {
                      _swapTiles(index);
                    }
                  },
                  child: ImageTile(
                    key: ValueKey(index), // Ajout pour optimiser la performance de rendu
                    imageUrl: imageUrl,
                    tile: tiles[index],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Déplacements: $_score', style: const TextStyle(fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              onPressed: _gameStarted ? _stopGame : _startGame,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (_gameStarted) {
                      return Colors.red; // Stop button color
                    } else {
                      return Colors.green; // Start button color
                    }
                  },
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
              ),
              child: Text(_gameStarted ? 'Stopper la partie' : 'Lancer la partie'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_right_alt), 
                onPressed: !_gameStarted ? _decreaseGridSize : null,
              ),
              Text('Taille de la grille : $_gridSize'),
              IconButton(
                icon: const Icon(Icons.zoom_in), 
                onPressed: !_gameStarted ? _increaseGridSize : null,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _showTchoupi = !_showTchoupi;
              });
            },
            child: Text(_showTchoupi ? "Cacher T'choupi" : "Afficher T'choupi"),
          ),
          if (_showTchoupi)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // DialogueBubble est maintenant à gauche de l'image T'choupi
                DialogueBubble(key: const ValueKey('DialogueBubble'), text: _currentPhrase),
                const SizedBox(width: 10), // Espacement entre le texte et l'image
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
    ));
  }


    }

class DialogueBubble extends StatelessWidget {
  final String text;

  const DialogueBubble({super.key, required this.text});

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
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
