import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const LogoApp());

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({
    super.key,
    required Animation<double> animation,
  }) : super(listenable: animation);

  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeOutCubic)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedLogo(animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class UsedInTutorialTextOnly extends _LogoAppState {
  UsedInTutorialTextOnly() {
    // ignore: unused_local_variable, prefer_typing_uninitialized_variables
    var animation, sizeAnimation, opacityAnimation, tween, colorTween;

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    sizeAnimation = Tween<double>(begin: 0, end: 300).animate(controller);
    opacityAnimation = Tween<double>(begin: 0.1, end: 1).animate(controller);

    tween = Tween<double>(begin: -200, end: 0);

    colorTween = ColorTween(begin: Colors.transparent, end: Colors.black54);
  }

  usedInTutorialOnly1() {
    AnimationController controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    Animation<int> alpha = IntTween(begin: 0, end: 255).animate(controller);
    return alpha;
  }

  usedInTutorialOnly2() {
    AnimationController controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    final Animation<double> curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    );

    Animation<int> alpha = IntTween(begin: 0, end: 255).animate(curve);

    return alpha;
  }
}

class ShakeCurve extends Curve {
  @override
  double transform(double t) => sin(t * pi * 2);
}
