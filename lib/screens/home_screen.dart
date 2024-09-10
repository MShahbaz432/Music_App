import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player_ui/config/colors.dart';
import 'package:music_player_ui/config/song_model_class.dart';
import 'package:music_player_ui/config/song_pictures.dart';
import 'package:music_player_ui/screens/favourite_screen.dart';
import 'package:music_player_ui/widget/drawer_menu_widget.dart';
import 'package:music_player_ui/widget/playing_screen_widget.dart';
import 'package:music_player_ui/widget/song_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPlaying = false;
  bool isShuffle = false;
  bool isRepeat = false;
  bool isFavourite = false;
  List<Song> songs = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 9, 23, 54),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isShuffle = !isShuffle;
                });
              },
              icon: Icon(
                isShuffle ? Icons.shuffle_on : Icons.shuffle,
                color: AppColors.primaryColor,
                size: 20.w,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isRepeat = !isRepeat;
                });
              },
              icon: Icon(
                isRepeat ? Icons.repeat_on : Icons.repeat,
                color: AppColors.primaryColor,
                size: 20.w,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.library_music,
                color: AppColors.primaryColor,
                size: 20.w,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (e) => FavouriteScreen()));
                setState(() {
                  isFavourite = !isFavourite;
                });
              },
              icon: Icon(
                isRepeat ? Icons.favorite : Icons.favorite_border_outlined,
                color: AppColors.primaryColor,
                size: 20.w,
              ),
            )
          ],
        ),
      ),
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.primaryColor,
        ),
        backgroundColor: AppColors.bgColor,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
            ),
            child: Icon(
              Icons.search,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.bgColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
          child: Container(
            color: AppColors.bgColor,
            child: ListView(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.close_rounded,
                        color: AppColors.primaryColor,
                      ),
                      Icon(
                        Icons.brightness_2_outlined,
                        color: AppColors.scondaryColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                DrawerMenuWidget(
                  icon: Icons.person_2_rounded,
                  text: 'Profile',
                ),
                SizedBox(
                  height: 25.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (e) => FavouriteScreen()));
                  },
                  child: DrawerMenuWidget(
                    icon: Icons.favorite_outline,
                    text: 'Liked Songs',
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                DrawerMenuWidget(
                  icon: Icons.public_outlined,
                  text: 'Language',
                ),
                SizedBox(
                  height: 25.h,
                ),
                DrawerMenuWidget(
                  icon: Icons.message,
                  text: 'Contact us',
                ),
                SizedBox(
                  height: 25.h,
                ),
                DrawerMenuWidget(
                  icon: Icons.lightbulb_outline,
                  text: 'FAQs',
                ),
                SizedBox(
                  height: 25.h,
                ),
                DrawerMenuWidget(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recommended for you',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 250.h,
                child: ListView.builder(
                    itemCount: songs.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlayingScreenWidget(
                                        songTitle: songs[index].songTitle,
                                        singer: songs[index].singer,
                                        songimage: songs[index].songimage,
                                      )));
                        },
                        child: SongContainer(
                          songTitle: songs[index].songTitle,
                          singer: songs[index].singer,
                          songimage: songs[index].songimage,
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'My Playlist',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 350.h,
                child: ListView.builder(
                    itemCount: songs.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (contextt) => PlayingScreenWidget(
                                songTitle: songs[index].songTitle,
                                singer: songs[index].singer,
                                songimage: songs[index].songimage,
                              ),
                            ),
                          );
                        },
                        child: SongContainer(
                          songTitle: songs[index].songTitle,
                          singer: songs[index].singer,
                          songimage: songs[index].songimage,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
