import 'package:flutter/material.dart';
import 'package:music_player_ui/config/colors.dart';

class SongContainer extends StatelessWidget {
  final String songTitle;
  final String singer;
  final String songimage;
  final Widget? trailing;

  const SongContainer({
    super.key,
    required this.songTitle,
    required this.singer,
    required this.songimage,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 170,
      // color: Colors.amber,
      child: Column(
        children: [
          Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(songimage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            songTitle,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            singer,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16,
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
