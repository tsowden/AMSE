import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page d\'accueil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Bienvenue sur la page d\'accueil',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                context.go('/favorites_page');
              },
              icon: const Icon(Icons.favorite),
              label: const Text('Favoris'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50), // Set the minimum button size
              ),
            ),
            SizedBox(height: 20), // Spacing between buttons
            ElevatedButton.icon(
              onPressed: () {
                context.go('/media_page');
              },
              icon: const Icon(Icons.photo_library),
              label: const Text('Media'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50), // Set the minimum button size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
