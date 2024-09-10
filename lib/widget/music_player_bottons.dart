import 'package:flutter/material.dart';
import 'package:music_player_ui/config/colors.dart';

class MusicPlayerBottons extends StatefulWidget {
  final String? title1;
  final String? singer;
  const MusicPlayerBottons({super.key, this.singer = '', this.title1});

  @override
  State<MusicPlayerBottons> createState() => _MusicPlayerBottonsState();
}

class _MusicPlayerBottonsState extends State<MusicPlayerBottons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83,
      width: double.maxFinite,
      color: AppColors.bgColor,
      child: Row(
        children: [
          Container(
            height: 83,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  image: AssetImage('assets/music_player/play_icon.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Chaff & Dust',
                    style:
                        TextStyle(fontSize: 20, color: AppColors.primaryColor),
                  ),
                  Text(
                    'HYONNA',
                    style:
                        TextStyle(fontSize: 16, color: AppColors.primaryColor),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous_rounded,
                      color: AppColors.primaryColor,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow,
                      color: AppColors.primaryColor,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_next_rounded,
                      color: AppColors.primaryColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
