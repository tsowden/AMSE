import 'package:flutter/material.dart';

class MeilleursScoresPage extends StatelessWidget {
  const MeilleursScoresPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meilleurs Scores'),
      ),
      body: const Center(
        child: Text('Contenu de la page des meilleurs scores'),
      ),
    );
  }
}
