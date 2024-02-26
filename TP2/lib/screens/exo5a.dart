import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Example'),
      ),
      body: GridView.count(
        crossAxisCount: 3, 
        children: List.generate(9, (index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.primaries[index % Colors.primaries.length], 
              border: Border.all(color: Colors.white, width: 3), 
            ),
            child: Center(
              child: Text(
                'Tile ${index + 1}', 
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          );
        }),
      ),
    );
  }
}
