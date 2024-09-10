import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player_ui/config/colors.dart';
import 'package:music_player_ui/config/song_collection.dart';
import 'package:music_player_ui/config/song_model_class.dart';
import 'package:music_player_ui/config/song_pictures.dart';
import 'package:music_player_ui/screens/home_screen.dart';

class PlayingScreenWidget extends StatefulWidget {
  final String songTitle;
  final String singer;
  final String songimage;
  const PlayingScreenWidget({
    super.key,
    required this.songTitle,
    required this.singer,
    required this.songimage,
  });

  @override
  State<PlayingScreenWidget> createState() => _PlayingScreenWidgetState();
}

List<Song> favoriteSongs = [];

class _PlayingScreenWidgetState extends State<PlayingScreenWidget> {
  bool isPlaying = false;
  bool isShuffle = false;
  bool isRepeat = false;
  bool isFavourite = false;
  double currentSliderValue = 0;
  List<Song> song = [
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
  final audioplayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
// String formatTime(Duration duration){
//   String twoDigits(int n) =>n.toString().padLeft(2,'0');
//   final hours=
// }
  @override
  void dispose() {
    audioplayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          iconTheme: IconThemeData(color: AppColors.primaryColor),
          leading: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (e) => HomeScreen()));
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            'Playing Song',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryColor),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Center(
                  child: Container(
                    height: 240.h,
                    width: 240.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.w)),
                      color: Colors.amber,
                      image: DecorationImage(
                        image: AssetImage(widget.songimage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.w,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(100.w, 0.h, 10.w, 0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.songTitle,
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor),
                      ),
                      Spacer(),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFavourite = !isFavourite;
                            if (isFavourite) {
                              favoriteSongs.add(
                                Song(
                                    songTitle: widget.songTitle,
                                    singer: widget.singer,
                                    songimage: widget.songimage),
                              );
                              print('favourite');
                            } else {
                              favoriteSongs.removeWhere((song) =>
                                  song.songTitle == widget.songTitle &&
                                  song.singer == widget.singer &&
                                  song.songimage == widget.songimage);
                            }
                            print('unfavourite');
                          });
                        },
                        icon: Icon(
                          isFavourite ? Icons.favorite : Icons.favorite_border,
                          color: isFavourite
                              ? Colors.red
                              : AppColors.scondaryColor,
                          size: 25.w,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Text(
                  widget.singer,
                  style: TextStyle(
                      fontSize: 16.sp, color: AppColors.scondaryColor),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.volume_up,
                            color: AppColors.scondaryColor,
                            size: 25.w,
                          )),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isRepeat = !isRepeat;
                          });
                        },
                        icon: Icon(
                          isRepeat ? Icons.repeat_on : Icons.repeat,
                          color: AppColors.scondaryColor,
                          size: 25.w,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isShuffle = !isShuffle;
                          });
                        },
                        icon: Icon(
                          isShuffle ? Icons.shuffle_on : Icons.shuffle,
                          color: AppColors.scondaryColor,
                          size: 25.w,
                        ),
                      )
                    ],
                  ),
                ),
                Slider(
                  value: position.inSeconds.toDouble(),
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  activeColor: AppColors.primaryColor,
                  inactiveColor: AppColors.scondaryColor,
                  onChanged: (double value) {
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_previous_outlined,
                        color: AppColors.primaryColor,
                        size: 35.w,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        if (isPlaying) {
                          await audioplayer.pause();
                        } else {
                          String audioUrl = SongCollection.pson1;
                          await audioplayer.setSourceAsset(audioUrl);
                        }
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: AppColors.primaryColor,
                        size: 35.w,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.skip_next_outlined,
                        color: AppColors.primaryColor,
                        size: 35.w,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
