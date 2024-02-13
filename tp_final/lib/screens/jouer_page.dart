import 'package:flutter/material.dart';

class JouerPage extends StatelessWidget {
  const JouerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jouer'),
      ),
      body: const Center(
        child: Text('Contenu de la page de jeu'),
      ),
    );
  }
}
