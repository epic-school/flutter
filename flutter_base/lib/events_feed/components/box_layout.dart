import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/constants/decoration.dart';

class BoxLayout extends StatelessWidget {
  final double? width;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  final Widget? child;

  const BoxLayout({
    Key? key,
    this.width = 292.0,
    this.margin = const EdgeInsets.symmetric(horizontal: 4.0),
    this.decoration = AppDecoration.decor16,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      decoration: decoration,
      child: child,
    );
  }
}
