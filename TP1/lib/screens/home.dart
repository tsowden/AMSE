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
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                context.go('/about_page');
              },
              icon: const Icon(Icons.info),
              label: const Text('A propos'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
              ),
              
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
