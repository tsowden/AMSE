class MediaModel {
  final int id; // Ajout d'un champ id
  final String imageUrl;
  final String title;
  final String artist;
  final String? album;
  final String? description; 

  const MediaModel({
    required this.id,
    required this.title,
    this.artist = 'Artiste inconnu',
    this.album,
    this.imageUrl = 'assets/imgs/default.png',
    this.description, 
  });
}

const musics = [
  MediaModel(
    id: 1,
    imageUrl: 'assets/imgs/default.png', 
    title: 'Never Gonna Give You Up',
    artist: 'Rick Ashley',
    album: 'Whenever You Need Somebody',
  ),
  MediaModel(
    id: 2,
    imageUrl: 'assets/imgs/she.png',
    title: 'Nwantiti',
    artist: 'Shéhéraz\'art',
    album: 'Campagne BDA 2022',
  ),
  MediaModel(
    id: 3,
    imageUrl: 'assets/imgs/default.png',
    title: 'Anissa',
    artist: 'Wejdene',
    album: '16',
  ),
  MediaModel(
    id: 4,
    imageUrl: 'assets/imgs/default.png',
    title: 'MONTERO (Call Me By Your Name)',
    artist: 'Lil Nas X',
    album: 'MONTERO',
  ),
  MediaModel(
    id: 5,
    imageUrl: 'assets/imgs/default.png',
    title: 'INDUSTRY BABY (feat. Jack Harlow)',
    artist: 'Lil Nas X',
    album: 'MONTERO',
  ),
  MediaModel(
    id: 6,
    imageUrl: 'assets/imgs/default.png',
    title: 'THATS WHAT I WANT',
    artist: 'Lil Nas X',
    album: 'MONTERO',
  ),
];


const podcasts = [
  MediaModel(
    id: 100,
    imageUrl: 'assets/imgs/default.png', 
    title: 'La vie a-t-elle un sens ?',
    artist: 'Tom SOWDEN & Charlotte BLOUIN',
    description: '"La vie a-t-elle un sens ?" est un podcast fascinant animé par Tom SOWDEN et Charlotte BLOUIN, qui vous invite à explorer les grandes questions existentielles de la vie. À travers des discussions approfondies, des interviews d\'experts et des témoignages émouvants, ce podcast cherche à dévoiler les différentes perspectives sur le sens de la vie, l\'accomplissement personnel et la quête de bonheur. ',
  ),

    MediaModel(
    id: 101,
    imageUrl: 'assets/imgs/default.png', 
    title: 'La reproduction des langoustines en Nouvelle-Zélande',
    artist: 'Tom SOWDEN & Charlotte BLOUIN',
    description: 'Plongez au cœur des mystères de la mer avec Tom SOWDEN et Charlotte BLOUIN dans "La reproduction des langoustines en Nouvelle-Zélande". Ce podcast captivant vous emmène dans une exploration scientifique et écologique, révélant les secrets de la vie marine et l\'importance de la préservation des espèces. Une aventure auditive qui change notre regard sur l\'océan.',
  ),
];