import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const routeName = 'about_page';
  static const fullPath = '/$routeName';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos',style:TextStyle(color: Color.fromARGB(255, 244, 230, 255),fontFamily: 'Bebas',)),
      backgroundColor: const Color.fromARGB(255, 74, 56, 72),),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'À propos de notre application',
              style: TextStyle(
                fontSize: 26,
                color: Color.fromARGB(255, 244, 230, 255),
                fontFamily: 'Bebas',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Bienvenue dans notre application de musique ! Nous sommes Charlotte Blouin et Tom Sowden, les créateurs de cette application. Notre objectif est de vous fournir une expérience musicale exceptionnelle où vous pouvez découvrir de nouvelles chansons et podcasts.',
              style: TextStyle(fontSize: 16,fontFamily: 'MonoSpatial',color: Color.fromARGB(255, 244, 230, 255),),
            ),
            SizedBox(height: 20),
            Text(
              'Charlotte Blouin',
              style: TextStyle(
                fontFamily: 'KC',
                fontSize: 22,
                color: Color.fromARGB(255, 244, 230, 255),
              ),
            ),
            Text(
              'Charlotte est une passionnée de musique et de technologie. Elle a travaillé dur pour créer une application qui offre une interface conviviale et une vaste sélection de contenu musical.',
              style: TextStyle(fontSize: 16,fontFamily: 'MonoSpatial',color: Color.fromARGB(255, 244, 230, 255),),
            ),
            SizedBox(height: 10),
            Text(
              'Tom Sowden',
              style: TextStyle(
                fontFamily: 'KC',
                fontSize: 22,
                color: Color.fromARGB(255, 244, 230, 255),
              ),
            ),
            Text(
              'Tom est un développeur talentueux avec une passion pour la création d\'applications innovantes. Il a mis en œuvre les fonctionnalités et les performances de notre application pour offrir la meilleure expérience utilisateur possible.',
              style: TextStyle(fontSize: 16,fontFamily: 'MonoSpatial',color: Color.fromARGB(255, 244, 230, 255),),
            ),
          ],
        ),
      ),
    );
  }
}
