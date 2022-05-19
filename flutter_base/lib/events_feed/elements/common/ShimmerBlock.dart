import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_base/events_feed/colors.dart';

class ShimmerBlock extends StatelessWidget {
  final double width;
  final double height;
  const ShimmerBlock({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Color.fromARGB(109, 255, 255, 255),
        highlightColor: Color.fromARGB(255, 255, 255, 255),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: AppColors.shimmer),
        ));
  }
}
