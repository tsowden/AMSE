import 'package:flutter/material.dart';

class ImageTiles extends StatelessWidget {
  final int crossAxisCount;
  final String imagePath;

  const ImageTiles({
    Key? key, 
    this.crossAxisCount = 3,
    required this.imagePath, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gridWidth = MediaQuery.of(context).size.width;
    Image image = Image.asset(
      imagePath,
      width: gridWidth,
      height: gridWidth, 
      fit: BoxFit.cover,
    );

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      itemCount: crossAxisCount * crossAxisCount,
      itemBuilder: (context, index) {
        final int row = index ~/ crossAxisCount;
        final int col = index % crossAxisCount;
        final Alignment alignment = Alignment(
          col * 2 / (crossAxisCount - 1) - 1,
          row * 2 / (crossAxisCount - 1) - 1,
        );

        return GridTile(
          child: ClipRect(
            child: Align(
              alignment: alignment,
              widthFactor: 1 / crossAxisCount,
              heightFactor: 1 / crossAxisCount,
              child: image,
            ),
          ),
        );
      },
    );
  }
}
