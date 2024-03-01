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

  const ImageTile({
    Key? key,
    required this.imageUrl,
    required this.tile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            border: Border.all(color: tile.id != null ? Colors.white : Colors.transparent, width: 3),
            color: tile.id != null ? null : Colors.transparent, 
          ),
          child: Align(
            alignment: tile.alignment,
            widthFactor: 1 / 3,
            heightFactor: 1 / 3,
            child: tile.id != null ? Image.network(imageUrl, fit: BoxFit.cover) : const SizedBox.shrink(),
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
  bool _showOriginalImage = false; 
  bool _showTchoupi = false; 
  int _gridSize = 3;
  List<int> moveHistory = [];
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

  String _currentPhrase = ""; 

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
      _score = 0; 
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
        _initializeTiles(); 
      });
    }
  }

  void _decreaseGridSize() {
    if (_gridSize > 3) {
      setState(() {
        _gridSize--;
        _initializeTiles(); 
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
        moveHistory.add(tappedIndex);
        _selectRandomPhrase();
      });
      if (_isWinner()) {
        _showVictoryDialog();
      }
    }
  }
  void _undoMove() {
      if (moveHistory.isNotEmpty) {
        setState(() {
          int lastMove = moveHistory.removeLast();
          int? emptyTileIndex = tiles.indexWhere((tile) => tile.id == null);

          Tile temp = tiles[lastMove];
          tiles[lastMove] = tiles[emptyTileIndex];
          tiles[emptyTileIndex] = temp;
          _score--;

        });
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
                Navigator.of(context).pop(); 
                _initializeTiles(); 
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
    data: AppTheme.darkTheme, 
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 7'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Déplacements: $_score', style: const TextStyle(fontSize: 20)),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _gridSize,
              ),
              itemCount: _gridSize * _gridSize,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      if (_gameStarted) {
                        _swapTiles(index);
                      }
                    },
                    child: ImageTile(
                      key: ValueKey(index), 
                      imageUrl: imageUrl,
                      tile: tiles[index],
                    ),
                  ),
                );
              },

            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: !_gameStarted ? _decreaseGridSize : null,
                child: const Text('<', style: TextStyle(fontSize: 14)), // Utilisez le texte au lieu de l'icône
              ),
              Text('Taille de la grille : $_gridSize'),
              TextButton(
                onPressed: !_gameStarted ? _increaseGridSize : null,
                child: const Text('>', style: TextStyle(fontSize: 14)), // Utilisez le texte au lieu de l'icône
              ),
            ],
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
                foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 24, 27, 39)), // Text color
              ),
              child: Text(_gameStarted ? 'Stopper la partie' : 'Lancer la partie'),
            ),
          ),
          const SizedBox(height: 8),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: ElevatedButton(
            onPressed: () {
              setState(() {
                _showTchoupi = !_showTchoupi;
              });
            },
            child: Text(_showTchoupi ? "Cacher T'choupi" : "Afficher T'choupi"),
          ),
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
          const SizedBox(height: 8),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: ElevatedButton(
              onPressed: moveHistory.isNotEmpty ? _undoMove : null, // Désactiver si l'historique est vide
              child: const Text('Annuler le dernier coup'),
            ),
          ),
          const SizedBox(height: 8),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: ElevatedButton(
            onPressed: () {
              setState(() {
                _showOriginalImage = !_showOriginalImage;
              });
            },
            child: Text(_showOriginalImage ? "Cacher l'image originale" : "Voir l'image originale"),
          ),
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
            const SizedBox(height: 8),
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
        color: const Color.fromARGB(255, 152, 112, 186), // Mauve clair
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
