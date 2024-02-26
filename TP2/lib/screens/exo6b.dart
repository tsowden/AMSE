import 'package:flutter/material.dart';
import 'dart:math' as math;

math.Random random = math.Random();

class Tile {
  Color color;

  Tile(this.color);

  // Ajoutez cette méthode randomColor à la classe Tile
  Tile.randomColor() : color = _generateRandomColor();

  static Color _generateRandomColor() {
    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }
}

class TileWidget extends StatefulWidget {
  final Tile tile;

  const TileWidget(this.tile, {super.key});

  @override
  _TileWidgetState createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        // Logique pour démarrer le déplacement de la tuile
        // Vous pouvez ajouter la logique pour échanger la tuile avec une autre ici
        print('Tile pressed: ${widget.tile.color}');
      },
      child: coloredBox(),
    );
  }

  Widget coloredBox() {
    return Container(
      color: widget.tile.color,
      child: const Padding(
        padding: EdgeInsets.all(70.0),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: PositionedTiles()));

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles =
      List<Widget>.generate(2, (index) => TileWidget(Tile.randomColor()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moving Tiles'),
        centerTitle: true,
      ),
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sentiment_very_satisfied), onPressed: swapTiles),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}
