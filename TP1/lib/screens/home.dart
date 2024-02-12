import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Page d\'accueil',
          style: TextStyle(fontFamily: 'Bebas',
          fontSize:12,
          color: Color.fromARGB(255, 244, 230, 255)
          ),
          ),
          backgroundColor: const Color.fromARGB(255, 74, 56, 72)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Bienvenue',
                style: TextStyle(fontFamily: 'Payback',
                fontSize: 35,
                color: Color.fromARGB(255, 244, 230, 255)
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50), // Add space between "Bienvenue" and buttons
            ElevatedButton.icon(
              onPressed: () {
                context.go('/favorites_page');
              },
              icon: const Icon(Icons.favorite),
              label: const Text('Favoris'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 74, 56, 72), // Couleur fond bouton
                foregroundColor: const Color.fromARGB(255, 244, 230, 255), // Couleur Texte
                minimumSize: const Size(200, 50),
                padding: const EdgeInsets.all(10),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Bebas',
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
           ),
          const SizedBox(height: 20), // Spacing between buttons
            ElevatedButton.icon(
              onPressed: () {
                context.go('/media_page');
              },
              icon: const Icon(Icons.photo_library),
              label: const Text('Media'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 74, 56, 72), // Couleur fond bouton
                foregroundColor: Color.fromARGB(255, 244, 230, 255), // Couleur Texte
                minimumSize: const Size(200, 50),
                padding: const EdgeInsets.all(10),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Bebas',
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
