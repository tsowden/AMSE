import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/favorites.dart';
import '/models/models.dart'; 

class MediaPage extends StatelessWidget {
  static const routeName = 'media_page';
  static const fullPath = '/$routeName';

  const MediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Découvrir des musiques'),
        actions: [
          TextButton.icon(
            onPressed: () {
              context.go(FavoritesPage.fullPath);
            },
            icon: const Icon(Icons.favorite_border),
            label: const Text('Favorites'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: musics.length, 
        cacheExtent: 20.0,
        controller: ScrollController(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) {
          final music = musics[index]; 
          return ItemTile(music); 
        },
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final MediaModel music;

  const ItemTile(this.music, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(music.imageUrl),
        ),
        title: Text(music.title),
        subtitle: Text('${music.artist} - ${music.album}'),
      ),
    );
  }
}
