import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import '/models/models.dart'; 

class MediaPage extends StatelessWidget {
    const MediaPage({super.key});

  static const routeName = 'media_page';
  static const fullPath = '/$routeName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vos découvertes', 
        style: TextStyle(
          color: Color.fromARGB(255, 244, 230, 255),
          fontFamily: 'Bebas'
        ),
        ),
      backgroundColor: const Color.fromARGB(255, 74, 56, 72),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Musiques', 
            style: TextStyle(
              fontSize: 20, 
              color: Color.fromARGB(255, 244, 230, 255),
              fontFamily: 'Bebas',
              
              )
              ),
          ),
          ...musics.map((music) => MusicTile(media: music)).toList(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Podcasts', style: TextStyle(
              fontSize: 20, 
              color: Color.fromARGB(255, 244, 230, 255),
              fontFamily: 'Bebas',
              )),
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
          style: const TextStyle(color: Color.fromARGB(255, 244, 230, 255),
          fontFamily: 'KC',
          ),
        ),
        subtitle: RichText(
          text: TextSpan(
            style: const TextStyle(color: Color.fromARGB(255, 244, 230, 255), fontFamily: 'KC', fontSize: 14),
            children: [
              const TextSpan(text: 'Artiste(s)', style: TextStyle(
                color: Color.fromARGB(255, 244, 230, 255),
                fontFamily: 'MonoSpatial',
              ),),
              TextSpan(text: ' : ${media.artist}\n',
              style: const TextStyle(
                color: Color.fromARGB(255, 244, 230, 255),
                fontFamily: 'MonoSpatial',
              ),),
              if (media.album != null) ...[
                const TextSpan(text: 'Album', style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color.fromARGB(255, 244, 230, 255),
                  fontFamily: 'MonoSpatial',)),
                TextSpan(text: ' : ${media.album}\n',
                style: const TextStyle(
                  color: Color.fromARGB(255, 244, 230, 255),
                  fontFamily: 'MonoSpatial',
                ),),
              ],
            ],
          ),
        ),
        trailing: Consumer<Favorites>(
          builder: (context, favorites, child) {
            final isFavorite = favorites.items.contains(media.id);
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
          style: const TextStyle(color: Color.fromARGB(255, 244, 230, 255),
                  fontFamily: 'KC',),
        ),
        subtitle: RichText(
          text: TextSpan(
            style: const TextStyle( color: Color.fromARGB(255, 244, 230, 255),
                  fontFamily: 'MonoSpatial',),
            children: [
              const TextSpan(text: 'Artiste', style: TextStyle(decoration: TextDecoration.underline, color: Color.fromARGB(255, 244, 230, 255),
                  fontFamily: 'MonoSpatial',)),
              TextSpan(text: ' : ${media.artist}\n',
              style: const TextStyle(color: Color.fromARGB(255, 244, 230, 255),
                  fontFamily: 'MonoSpatial',)),
              if (media.description != null) ...[
                const TextSpan(text: 'Description', style: TextStyle(decoration: TextDecoration.underline)),
                const TextSpan(text: ' : ', style: TextStyle(color: Color.fromARGB(255, 244, 230, 255),
                  fontFamily: 'MonoSpatial',)),
                TextSpan(text: media.description!, style: const TextStyle(color: Color.fromARGB(255, 244, 230, 255),
                  fontFamily: 'MonoSpatial',)),
              ],
            ],
          ),
        ),
        trailing: Consumer<Favorites>(
          builder: (context, favorites, child) {
            final isFavorite = favorites.items.contains(media.id);
            return IconButton(
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              color: isFavorite ? Color.fromARGB(255, 96, 8, 148) : null,
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
