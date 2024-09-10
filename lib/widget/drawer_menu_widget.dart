import 'package:flutter/material.dart';
import 'package:music_player_ui/config/colors.dart';

class DrawerMenuWidget extends StatelessWidget {
  final IconData? icon;
  final String? text;
  const DrawerMenuWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Icon(
          icon!,
          color: AppColors.scondaryColor,
          size: 30,
        ),
        SizedBox(
          width: width * 0.06,
        ),
        Text(
          text!,
          style:
              TextStyle(color: AppColors.primaryColor, fontSize: width * 0.05),
        ),
      ],
    );
  }
}
