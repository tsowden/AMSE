class MediaModel {
  final int id; // Ajout d'un champ id
  final String imageUrl;
  final String title;
  final String artist;
  final String? categorie;
  final String? album;
  final String? description; 

  const MediaModel({
    required this.id,
    required this.title,
    this.artist = 'Artiste inconnu',
    this.album,
    this.imageUrl = 'assets/imgs/default.png',
    this.description, 
    this.categorie,
  });
}

MediaModel? findMediaById(int id) {
  final allMedia = [...musics, ...podcasts];
  try {
    return allMedia.firstWhere((media) => media.id == id);
  } catch (e) {
    return null;
  }
}



const musics = [
  MediaModel(
    id: 1,
    imageUrl: 'assets/imgs/rick.jpg', 
    title: 'Never Gonna Give You Up',
    artist: 'Rick Ashley',
    album: 'Whenever You Need Somebody',
    categorie: 'Pop / Dance-pop'
  ),
  MediaModel(
    id: 2,
    imageUrl: 'assets/imgs/she.png',
    title: 'Nwantiti',
    artist: 'Shéhéraz\'art',
    album: 'Campagne BDA 2022',
    categorie: 'World Music / Afrobeat'
  ),
  MediaModel(
    id: 3,
    imageUrl: 'assets/imgs/16.jpg',
    title: 'Anissa',
    artist: 'Wejdene',
    album: '16',
    categorie: 'Pop Urbaine / R&B Français'
  ),
  MediaModel(
    id: 4,
    imageUrl: 'assets/imgs/montero.jpg',
    title: 'MONTERO (Call Me By Your Name)',
    artist: 'Lil Nas X',
    album: 'MONTERO',
    categorie: 'Hip-hop / Pop Rap'
  ),
  MediaModel(
    id: 5,
    imageUrl: 'assets/imgs/montero.jpg',
    title: 'INDUSTRY BABY (feat. Jack Harlow)',
    artist: 'Lil Nas X',
    album: 'MONTERO',
    categorie: 'Hip-hop / Trap'
  ),
  MediaModel(
    id: 6,
    imageUrl: 'assets/imgs/montero.jpg',
    title: 'THATS WHAT I WANT',
    artist: 'Lil Nas X',
    album: 'MONTERO',
    categorie: 'Pop Rap / Hip-hop'
  ),
    MediaModel(
    id: 7,
    imageUrl: 'assets/imgs/nirvana.jpg',
    title: 'Something In The Way',
    artist: 'Nirvana',
    album: 'Nevermind',
    categorie: 'Grunge / Alternative Rock'
  ),
  MediaModel(
    id: 8,
    imageUrl: 'assets/imgs/bonnie.jpg',
    title: 'Total Eclipse of the Heart',
    artist: 'Bonnie Tyler',
    album: 'Faster Than the Speed of Night',
    categorie: 'Pop Rock / Power Ballad'
  ),
  MediaModel(
    id: 9,
    imageUrl: 'assets/imgs/vivaldi.jpg',
    title: 'L\'hiver (Winter)',
    artist: 'Antonio Vivaldi',
    album: 'Les Quatre Saisons (The Four Seasons)',
    categorie: 'Classical / Baroque'
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
    imageUrl: 'assets/imgs/langoustine.jpg', 
    title: 'La reproduction des langoustines en Nouvelle-Zélande',
    artist: 'Tom SOWDEN & Charlotte BLOUIN',
    description: 'Plongez au cœur des mystères de la mer avec Tom SOWDEN et Charlotte BLOUIN dans "La reproduction des langoustines en Nouvelle-Zélande". Ce podcast captivant vous emmène dans une exploration scientifique et écologique, révélant les secrets de la vie marine et l\'importance de la préservation des espèces. Une aventure auditive qui change notre regard sur l\'océan.',
  ),
    MediaModel(
    id: 102,
    imageUrl: 'assets/imgs/ariana.png', 
    title: 'Ariana, sa vie, son histoire',
    artist: 'Ariana Grande Fan Club, Nizar MHAYA, Tom SOWDEN',
    description: 'Découvrez l\'histoire fascinante de l\'icône pop mondiale Ariana Grande dans ce podcast exclusif. Du début de sa carrière à ses plus grands succès, plongez dans les coulisses de la vie de cette artiste légendaire. Des interviews exclusives, des anecdotes surprenantes et des moments marquants vous attendent dans "Ariana, sa vie, son histoire". Un incontournable pour tous les fans de musique et de culture pop.',
  ),
];