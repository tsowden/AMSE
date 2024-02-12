import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const routeName = 'about_page';
  static const fullPath = '/$routeName';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('À propos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'À propos de notre application',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Bienvenue dans notre application de musique ! Nous sommes Charlotte Blouin et Tom Sowden, les créateurs de cette application. Notre objectif est de vous fournir une expérience musicale exceptionnelle où vous pouvez découvrir de nouvelles chansons et podcasts.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Charlotte Blouin',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'Charlotte est une passionnée de musique et de technologie. Elle a travaillé dur pour créer une application qui offre une interface conviviale et une vaste sélection de contenu musical.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Tom Sowden',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'Tom est un développeur talentueux avec une passion pour la création d\'applications innovantes. Il a mis en œuvre les fonctionnalités et les performances de notre application pour offrir la meilleure expérience utilisateur possible.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
