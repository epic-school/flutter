import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ImageCacheDemo(),
  ));
}

class ImageCacheDemo extends StatelessWidget {
  const ImageCacheDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageScr = "https://free4kwallpapers.com/uploads/originals/2020/05/09/street-city-by-the-vantage-point-wallpaper.jpg";
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Image.network(
              imageScr,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress,) {
                if (loadingProgress == null) {
                  return child;
                }
                return const CircularProgressIndicator();
              },
            ),
            CachedNetworkImage(
              placeholder: (context, url) => const CircularProgressIndicator(),
              imageUrl: imageScr,
            ),
          ],
        ),
      ),
    );
  }
}
