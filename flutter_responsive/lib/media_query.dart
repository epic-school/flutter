import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MediaQueryExample(),));
}

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData device = MediaQuery.of(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Device width: ${device.size.width}, height: ${device.size.height}"),
          Text("Orientation: ${device.orientation.name}"),
          Text("Padding: ${device.padding}"),
          // Части ui закрытые пользовательским интерфейсом системы (клавиатурой)
          Text("ViewInsets: ${device.viewInsets}"),
          // Размер текста заданный пользовательскими настройками.
          // boldText включен ли у пользователя настройка жирный текст.
          Text("Text scale: ${device.textScaleFactor}, text bold scale: ${device.boldText}"),
          // Выключена ли анимация
          Text("Animation: ${device.disableAnimations}"),
          Text("Colors: ${device.platformBrightness}, invert: ${device.invertColors}"),
          Text("Time: ${device.alwaysUse24HourFormat}"),
        ],
      ),
    );
  }
}


