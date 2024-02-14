import 'package:flutter/material.dart';

class Exo2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exo 2 : Transformer une image'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white, 
            ),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(0.78), 
              child: Image.network(
                'https://picsum.photos/512/1024',
                key: UniqueKey(), 
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
