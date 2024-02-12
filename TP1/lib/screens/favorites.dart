import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import '/models/models.dart'; 
import '/screens/media.dart'; 


class FavoritesPage extends StatelessWidget {
  static const routeName = 'favorites_page';
  static const fullPath = '/$routeName';

  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<Favorites>(context);
    final favoriteMusics = musics.where((music) => favoritesProvider.items.contains(music.id)).toList();
    final favoritePodcasts = podcasts.where((podcast) => favoritesProvider.items.contains(podcast.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vos favoris',style:TextStyle(color: Color.fromARGB(255, 244, 230, 255),fontFamily: 'Bebas',)),
        backgroundColor: const Color.fromARGB(255, 74, 56, 72),
      ),
      body: ListView(
        children: [
          if (favoriteMusics.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Musiques favorites', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            ...favoriteMusics.map((music) => MusicTile(media: music)).toList(),
          ],
          if (favoritePodcasts.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Podcasts favoris', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            ...favoritePodcasts.map((podcast) => PodcastTile(media: podcast)).toList(),
          ],
        ],
      ),
    );
  }
}
