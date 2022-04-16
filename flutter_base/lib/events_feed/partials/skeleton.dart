import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 16.0),
      child: Shimmer.fromColors(
        enabled: false,
        baseColor: const Color.fromARGB(15, 255, 255, 255),
        highlightColor: const Color.fromARGB(25, 255, 255, 255),
        child: Wrap(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: const <Widget>[
                TitleSkeletonRenderer(),
                ItemSkeletonRenderer(height: 256.0),
                TitleSkeletonRenderer(),
                ItemSkeletonRenderer(height: 148.0),
                TitleSkeletonRenderer(),
                ItemSkeletonRenderer(height: 96.0),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ItemSkeletonRenderer extends StatelessWidget {
  const ItemSkeletonRenderer({
    required this.height,
    Key? key,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        direction: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              width: 292.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              width: 292.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleSkeletonRenderer extends StatelessWidget {
  const TitleSkeletonRenderer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 26.0,
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
