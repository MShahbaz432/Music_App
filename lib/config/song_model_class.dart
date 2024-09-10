import 'package:music_player_ui/config/song_pictures.dart';

class Song {
  final String songTitle;
  final String singer;
  final String songimage;

  Song({
    required this.songTitle,
    required this.singer,
    required this.songimage,
  });
}

final List<Song> songs = [
  Song(
    songTitle: 'Akh Kashni',
    singer: 'Surbhi Yadav',
    songimage: SongPictures.psongpic1,
  ),
  Song(
    songTitle: 'Chikni Chameli',
    singer: 'Shreya Ghoshal',
    songimage: SongPictures.psongpic2,
  ),
  Song(
    songTitle: 'Deewana Tera',
    singer: 'Sonu Nigam',
    songimage: SongPictures.psongpic3,
  ),
  Song(
    songTitle: 'Gaya Gaya Gaya',
    singer: 'Amit Trivedi',
    songimage: SongPictures.psongpic4,
  ),
  Song(
    songTitle: 'Gulmohar',
    singer: 'Shahid Mallya',
    songimage: SongPictures.psongpic5,
  ),
  Song(
    songTitle: 'Jehda Nasha',
    singer: 'Tanishk Bagchi',
    songimage: SongPictures.psongpic6,
  ),
  Song(
    songTitle: 'Kesariya',
    singer: 'Pritam',
    songimage: SongPictures.songpic1,
  ),
  Song(
    songTitle: 'Maan Le',
    singer: 'Arijit Singh',
    songimage: SongPictures.songpic2,
  ),
  Song(
    songTitle: 'Mera Love Main',
    singer: 'Chup',
    songimage: SongPictures.songpic3,
  ),
  Song(
    songTitle: 'Naina',
    singer: 'Armaan Malik',
    songimage: SongPictures.songpic4,
  ),
  Song(
    songTitle: 'Tum Hi Ho',
    singer: 'Arijit Singh',
    songimage: SongPictures.songpic5,
  ),
  Song(
    songTitle: 'Yeh Duniya Agar',
    singer: 'Sneha Shankar',
    songimage: SongPictures.songpic6,
  ),
];
