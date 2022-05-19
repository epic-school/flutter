import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/elements/common/ShimmerBlock.dart';

class ImageWithAR extends StatelessWidget {
  final double width;
  final double height;
  final bool shimmer;

  const ImageWithAR({
    Key? key,
    required this.width,
    required this.height,
    required this.shimmer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return shimmer
        ? ShimmerBlock(width: width, height: height)
        : AspectRatio(
            aspectRatio: width / height,
            child: const _Image(),
          );
  }
}

class _Image extends StatelessWidget {
  const _Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('IMG'),
      ),
    );
  }
}
