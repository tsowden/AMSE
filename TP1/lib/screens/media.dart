import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/favorites.dart';
import '/models/models.dart'; 

class MediaPage extends StatelessWidget {
    const MediaPage({super.key});

  static const routeName = 'media_page';
  static const fullPath = '/$routeName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Découvrir des musiques et podcasts'),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Musiques', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          ...musics.map((music) => MusicTile(media: music)).toList(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Podcasts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          ...podcasts.map((podcast) => PodcastTile(media: podcast)).toList(),
        ],
      ),
    );
  }
}
class MusicTile extends StatelessWidget {
  final MediaModel media;

  const MusicTile({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(media.imageUrl, width: 50, height: 50),
        title: Text(
          media.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 14),
            children: [
              const TextSpan(text: 'Artiste(s)', style: TextStyle(decoration: TextDecoration.underline)),
              TextSpan(text: ' : ${media.artist}\n'),
              if (media.album != null) ...[
                const TextSpan(text: 'Album', style: TextStyle(decoration: TextDecoration.underline)),
                TextSpan(text: ' : ${media.album}\n'),
              ],
            ],
          ),
        ),
        trailing: Consumer<Favorites>(
          builder: (context, favorites, child) {
            final isFavorite = favorites.items.contains(media.id); // Assurez-vous que `media` a un champ `id`
            return IconButton(
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              color: isFavorite ? Colors.red : null,
              onPressed: () {
                if (isFavorite) {
                  favorites.remove(media.id);
                } else {
                  favorites.add(media.id);
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class PodcastTile extends StatelessWidget {
  final MediaModel media;

  const PodcastTile({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(media.imageUrl, width: 50, height: 50),
        title: Text(
          media.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 14),
            children: [
              const TextSpan(text: 'Artiste', style: TextStyle(decoration: TextDecoration.underline)),
              TextSpan(text: ' : ${media.artist}\n'),
              if (media.description != null) ...[
                const TextSpan(text: 'Description', style: TextStyle(decoration: TextDecoration.underline)),
                TextSpan(text: ' : ', style: TextStyle(fontStyle: FontStyle.italic)),
                TextSpan(text: media.description!, style: TextStyle(fontStyle: FontStyle.italic)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
