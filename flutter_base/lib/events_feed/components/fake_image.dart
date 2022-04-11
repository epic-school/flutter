import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/constants/colors.dart';

class FakeImage extends StatelessWidget {
  const FakeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white.withOpacity(0.8),
      child: const Center(
        child: Text('IMG'),
      ),
    );
  }
}