import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/constants/colors.dart';

class BoxLayout extends StatelessWidget {

  final Widget child;

  const BoxLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 292.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: child,
    );
  }
}
