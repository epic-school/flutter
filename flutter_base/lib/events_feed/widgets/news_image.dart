import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/constants/border_radius.dart';


class NewsImage extends StatelessWidget {
  final Widget child;
  const NewsImage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 292 / 150,
      child: ClipRRect(
          borderRadius: AppBorderRadius.borderRadiusTopLR8,
          child: child),
    );
  }
}
