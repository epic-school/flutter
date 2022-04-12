import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/constants/border_radius.dart';
import 'package:flutter_base/events_feed/constants/colors.dart';

class UserPhoto extends StatelessWidget {
  final Widget child;

  const UserPhoto({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: AppBorderRadius.borderRadiusAll8,
          border: Border.all(color: AppColors.cardBackground)),
      child: ClipRRect(
        borderRadius: AppBorderRadius.borderRadiusAll8,
        child: child,
      ),
    );
  }
}
