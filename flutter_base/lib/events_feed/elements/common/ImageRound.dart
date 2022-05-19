import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/elements/common/ShimmerBlock.dart';

class ImageRownd extends StatelessWidget {
  final double width;
  final double height;
  final bool shimmer;

  const ImageRownd({
    Key? key,
    required this.width,
    required this.height,
    required this.shimmer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return shimmer
        ? ShimmerBlock(width: width, height: height)
        : Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: const Center(
              child: Text('IMG'),
            ));
  }
}
