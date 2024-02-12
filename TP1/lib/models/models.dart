class MediaModel {
  final String imageUrl;
  final String title;
  final String artist;
  final String album;

  const MediaModel({
    required this.imageUrl,
    required this.title,
    required this.artist,
    required this.album,
  });
}

const musics = [
  MediaModel(
    imageUrl: 'assets/imgs/she.png', 
    title: 'Never Gonna Give You Up',
    artist: 'Rick Ashley',
    album: 'Whenever You Need Somebody',
  ),
  MediaModel(
    imageUrl: 'assets/imgs/she.png',
    title: 'Nwantiti',
    artist: 'Shéhéraz\'art',
    album: 'Campagne BDA 2022',
  ),
  MediaModel(
    imageUrl: 'assets/imgs/she.png',
    title: 'Anissa',
    artist: 'Wejdene',
    album: '16',
  ),
  MediaModel(
    imageUrl: 'assets/imgs/she.png',
    title: 'MONTERO (Call Me By Your Name)',
    artist: 'Lil Nas X',
    album: 'MONTERO',
  ),
  MediaModel(
    imageUrl: 'assets/imgs/she.png',
    title: 'INDUSTRY BABY (feat. Jack Harlow)',
    artist: 'Lil Nas X',
    album: 'MONTERO',
  ),
  MediaModel(
    imageUrl: 'assets/imgs/she.png',
    title: 'THATS WHAT I WANT',
    artist: 'Lil Nas X',
    album: 'MONTERO',
  ),
];
