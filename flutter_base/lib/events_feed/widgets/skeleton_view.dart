import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/constants/colors.dart';

final _decoration = BoxDecoration(
    color: AppColors.cardBackground, borderRadius: BorderRadius.circular(8.0));

class SkeletonView extends StatelessWidget {
  const SkeletonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const _TitleSkeleton(),
      SizedBox(
        height: 256.0,
        child: Wrap(
            direction: Axis.vertical,
            children: const [_NewsSkeleton(), _NewsSkeleton()]),
      ),
      const _TitleSkeleton(),
      SizedBox(
        height: 148.0,
        child: Wrap(
            direction: Axis.vertical,
            children: const [_EventsSkeleton(), _EventsSkeleton()]),
      ),
      const _TitleSkeleton(),
      SizedBox(
        height: 96.0,
        child: Wrap(
            direction: Axis.vertical,
            children: const [_BirthdaysSkeleton(), _BirthdaysSkeleton()]),
      ),
      const SizedBox(height: 46),
    ]);
  }
}

class _TitleSkeleton extends StatelessWidget {
  const _TitleSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 24.0, 20.0, 16.0),
      child: Container(width: 343.0, height: 26.0, decoration: _decoration),
    );
  }
}

class _NewsSkeleton extends StatelessWidget {
  const _NewsSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: 292.0,
      decoration: _decoration,
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 292 / 150,
            child: Container(color: AppColors.cardBackground),
          ),
          const SizedBox(height: 14.0),
          Container(width: 260.0, height: 44.0, decoration: _decoration),
          const SizedBox(height: 10.0),
          Container(width: 260.0, height: 22.0, decoration: _decoration),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class _EventsSkeleton extends StatelessWidget {
  const _EventsSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: 292.0,
      decoration: _decoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 64.0, height: 64.0, decoration: _decoration),
              const SizedBox(width: 8.0),
              Column(
                children: [
                  Container(
                      width: 188.0, height: 20.0, decoration: _decoration),
                  const SizedBox(height: 11.0),
                  Container(
                      width: 188.0, height: 12.0, decoration: _decoration),
                  const SizedBox(height: 9.0),
                  Container(
                      width: 188.0, height: 12.0, decoration: _decoration),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Container(width: 260.0, height: 40.0, decoration: _decoration),
        ],
      ),
    );
  }
}

class _BirthdaysSkeleton extends StatelessWidget {
  const _BirthdaysSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: 292.0,
      decoration: _decoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 64.0, height: 64.0, decoration: _decoration),
          const SizedBox(width: 8.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                      width: 135.0, height: 20.0, decoration: _decoration),
                  const SizedBox(width: 6.0),
                  Container(width: 47.0, height: 20.0, decoration: _decoration),
                ],
              ),
              const SizedBox(height: 11.0),
              Container(width: 188.0, height: 12.0, decoration: _decoration),
              const SizedBox(height: 9.0),
              Container(width: 188.0, height: 12.0, decoration: _decoration),
            ],
          ),
        ],
      ),
    );
  }
}