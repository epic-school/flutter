import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ImageDemo(),
  ));
}

class ImageDemo extends StatelessWidget {
  const ImageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/image.png',
              width: 200,
              height: 400,
              // fit: BoxFit.cover,
              // alignment: Alignment.bottomCenter,
              // repeat: ImageRepeat.repeat,
              // matchTextDirection: true,
              // color: Colors.red,
              // colorBlendMode: BlendMode.darken,
              // frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
              //   return Container(
              //     clipBehavior: Clip.hardEdge,
              //     decoration: BoxDecoration(
              //       border: Border.all(
              //         color: Colors.blue,
              //       ),
              //     ),
              //     child: child,
              //   );
              // }, 
            ),

            // Image.asset('assets/images/image.png', package: 'my-package',),

            // Image.network(
            //   "https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            //   loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress,) {
            //     if (loadingProgress == null) {
            //       return child;
            //     }
            //     return const Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   },
            //   errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace,) {
            //     return Container(
            //       height: 120,
            //       width: 240,
            //       color: Colors.red,
            //       child: const Center(
            //         child: Text("Image load error"),
            //       ),
            //     );
            //   },
            // ),

            // Image.memory(bytes)
            // Image.file(file)
          ],
        ),
      ),
    );
  }
}
