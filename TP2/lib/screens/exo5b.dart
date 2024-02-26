import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {
  final int rows = 3;
  final int columns = 3;
  final String imageUrl;

  const ImageGrid({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Grid'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
        ),
        itemCount: rows * columns,
        itemBuilder: (context, index) {
          final int row = index ~/ columns;
          final int col = index % columns;
          final double widthFactor = 1 / columns;
          final double heightFactor = 1 / rows;

          return ImageTile(
            imageUrl: imageUrl,
            alignment: Alignment(col * 2 / (columns - 1) - 1, row * 2 / (rows - 1) - 1),
            widthFactor: widthFactor,
            heightFactor: heightFactor,
          );
        },
      ),
    );
  }
}

class ImageTile extends StatelessWidget {
  final String imageUrl;
  final Alignment alignment;
  final double widthFactor;
  final double heightFactor;

  ImageTile({
    required this.imageUrl,
    required this.alignment,
    required this.widthFactor,
    required this.heightFactor,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: alignment,
            widthFactor: widthFactor,
            heightFactor: heightFactor,
            child: Image.network(imageUrl),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: ImageGrid(imageUrl: 'https://picsum.photos/512')));
}
