import 'package:flutter/material.dart';

class ImageTiles extends StatelessWidget {
  final int crossAxisCount;
  final String imagePath;

  ImageTiles({
    Key? key,
    this.crossAxisCount = 3,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gridWidth = MediaQuery.of(context).size.width;
    double tileSize = gridWidth / crossAxisCount;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      itemCount: crossAxisCount * crossAxisCount,
      itemBuilder: (context, index) {
        final int row = index ~/ crossAxisCount;
        final int col = index % crossAxisCount;

        // Calculer la position du morceau dans l'image d'origine
        double sourceWidth = tileSize * crossAxisCount;
        double sourceHeight = tileSize * crossAxisCount;

        double pieceWidth = sourceWidth / crossAxisCount;
        double pieceHeight = sourceHeight / crossAxisCount;

        double offsetX = col * pieceWidth;
        double offsetY = row * pieceHeight;

        Rect sourceRect = Rect.fromPoints(
          Offset(offsetX, offsetY),
          Offset(offsetX + pieceWidth, offsetY + pieceHeight),
        );

        // Charger l'image et découper le morceau
        Image image = Image.asset(
          imagePath,
          width: gridWidth,
          height: gridWidth,
          fit: BoxFit.cover,
        );

        return GridTile(
          child: ClipRect(
            child: Align(
              alignment: Alignment.center,
              child: Image(
                image: image.image,
                width: tileSize,
                height: tileSize,
                fit: BoxFit.cover,
                alignment: Alignment(-col * 2 / (crossAxisCount - 1) + 1, -row * 2 / (crossAxisCount - 1) + 1),
              ),
            ),
          ),
        );
      },
    );
  }
}
