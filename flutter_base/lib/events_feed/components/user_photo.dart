import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/constants/colors.dart';
import 'package:flutter_base/events_feed/components/get_image.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 64,
      height: 64,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: AppColors.cardBackground)),
      child: const GetImage(),
    );
  }
}