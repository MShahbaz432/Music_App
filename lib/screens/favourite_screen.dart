import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player_ui/config/colors.dart';
import 'package:music_player_ui/config/song_model_class.dart';
import 'package:music_player_ui/screens/home_screen.dart';
import 'package:music_player_ui/widget/playing_screen_widget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({
    super.key,
  });

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  bool isPlaying = false;
  bool isShuffle = false;
  bool isRepeat = false;
  bool isFavorite = false;
  void toggleFavorite(Song song) {
    setState(() {
      if (favoriteSongs.contains(song)) {
        favoriteSongs.remove(song);
      } else {
        favoriteSongs.add(song);
      }
    });
  }

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
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: Icon(
                  isRepeat ? Icons.favorite : Icons.favorite_border_outlined,
                  color: AppColors.primaryColor,
                  size: 20.w,
                ),
              )
            ],
          )),
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Liked Song',
              style: TextStyle(
                fontSize: 20.w,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: favoriteSongs.length,
                  itemBuilder: (content, index) {
                    final song = favoriteSongs[index];
                    return ListTile(
                      leading: Image.asset(
                        song.songimage,
                      ),
                      title: Text(
                        song.songTitle,
                        style: TextStyle(
                            fontSize: 20, color: AppColors.primaryColor),
                      ),
                      subtitle: Text(
                        song.singer,
                        style: TextStyle(
                            fontSize: 16, color: AppColors.scondaryColor),
                      ),
                      trailing: IconButton(
                          onPressed: () => toggleFavorite(song),
                          icon: Icon(
                              isFavorite
                                  ? Icons.favorite_border_outlined
                                  : Icons.favorite,
                              color: isFavorite ? Colors.grey : Colors.red)),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
