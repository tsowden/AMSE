import 'package:flutter/material.dart';

class ImageTiles extends StatelessWidget {
  final String imageUrl;
  final int crossAxisCount;

  ImageTiles({Key? key, required this.imageUrl, this.crossAxisCount = 3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taquin board'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
        ),
        itemCount: crossAxisCount * crossAxisCount,
        itemBuilder: (BuildContext context, int index) {
          // Calcul des coordonnées x et y pour chaque tuile
          final x = (index % crossAxisCount) / (crossAxisCount - 1);
          final y = (index ~/ crossAxisCount) / (crossAxisCount - 1);

          return FittedBox(
            fit: BoxFit.cover,
            child: ClipRect(
              child: Align(
                alignment: FractionalOffset(x, y),
                widthFactor: 1 / crossAxisCount,
                heightFactor: 1 / crossAxisCount,
                child: Image.network('https://picsum.photos/512'),
              ),
            ),
          );
        },
      ),
    );
  }
}
