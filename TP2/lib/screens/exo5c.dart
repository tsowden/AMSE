import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Grid Example',
      home: DynamicGridScreen(),
    );
  }
}

class DynamicGridScreen extends StatefulWidget {
  @override
  _DynamicGridScreenState createState() => _DynamicGridScreenState();
}

class _DynamicGridScreenState extends State<DynamicGridScreen> {
  int gridSize = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Grid Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ImageGrid2(
              imageUrl: 'https://picsum.photos/512',
              gridSize: gridSize,
            ),
          ),
          Slider(
            value: gridSize.toDouble(),
            min: 2,
            max: 10,
            divisions: 8,
            label: 'Grid Size: $gridSize',
            onChanged: (double newValue) {
              setState(() {
                gridSize = newValue.round();
              });
            },
          ),
        ],
      ),
    );
  }
}

class ImageGrid2 extends StatelessWidget {
  final String imageUrl;
  final int gridSize;

  const ImageGrid2({required this.imageUrl, required this.gridSize, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridSize,
      ),
      itemCount: gridSize * gridSize,
      itemBuilder: (context, index) {
        return ImageTile(
          imageUrl: imageUrl,
          tileIndex: index,
          gridSize: gridSize,
        );
      },
    );
  }
}

class ImageTile extends StatelessWidget {
  final String imageUrl;
  final int tileIndex;
  final int gridSize;

  const ImageTile({
    required this.imageUrl,
    required this.tileIndex,
    required this.gridSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: EdgeInsets.all(2),
      color: Colors.grey[300],
      child: Image.network(
        imageUrl,

        fit: BoxFit.cover,
      ),
    );
  }
}
