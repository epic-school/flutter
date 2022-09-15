import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: LayoutWidgets(),));
}

class LayoutWidgets extends StatelessWidget {
  const LayoutWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final MediaQueryData device = MediaQuery.of(context);

    return Scaffold(
      // AspectRatio
      // body: Container(
      //   width: 400,
      //   height: 400,
      //   color: Colors.green,
      //   alignment: Alignment.topCenter,
      //   child: AspectRatio(
      //     aspectRatio: 2 / 1,
      //     child: Container(color: Colors.red,),
      //   ),
      // )

      // body: Container(
      //   color: Colors.black26,
      //   width: 500.0,
      //   height: 500.0,
      //   child: FittedBox(
      //     fit: BoxFit.contain,
      //     child: Container(
      //         color: Colors.green,
      //         width: 100.0,
      //         height: 50.0,
      //         child: const Center(
      //           child: Text("Hello world", style: TextStyle(color: Colors.white)),
      //         )
      //     ),
      //   ),
      // ),

      // body: Container(
      //   width: 500.0,
      //   height: 400.0,
      //   color: const Color.fromARGB(255, 235, 237, 237),
      //   child: FractionallySizedBox(
      //     // alignment: AlignmentDirectional.topCenter,
      //     widthFactor: 0.5,
      //     heightFactor: 0.5,
      //     child: MaterialButton(
      //       color: Colors.green,
      //       textColor: Colors.white,
      //       onPressed: () {},
      //       child: const Text("Click"),
      //     ),
      //   ),
      // ),

      // body: Row(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Expanded(
      //       child: Container(color: Colors.red,),
      //     ),
      //     Expanded(
      //       flex: 2,
      //       child: Container(color: Colors.green,),
      //     ),
      //     Expanded(
      //       child: Container(color: Colors.blue,),
      //     ),
      //   ],
      // ),

      // body: Stack(
      //   children: [
      //     Center(
      //       child: Container(width: 100, height: 100, color: Colors.red,),
      //     ),
      //     // Align(
      //     //   child: Container(width: 100, height: 100, color: Colors.green,),
      //     // )
      //   ],
      // ),

      // body: ConstrainedBox(
      //   constraints: const BoxConstraints(
      //     maxWidth: 420,
      //     maxHeight: 420,
      //   ),
      //   child: Container(
      //     // width: 200,
      //     // height: 200,
      //     color: Colors.red,
      //   ),
      // ),

      // body: Column(
      //   children: [
      //     Container(color: Colors.black, height: 120,),
      //     Flexible(
      //       child: Container(color: Colors.red),
      //     ),
      //     Flexible(
      //       flex: 1,
      //       child: Container(color: Colors.blue,),
      //     ),
      //   ],
      // ),

      // IntrinsicHeight, IntrinsicWidth
      // body: Center(
      //   child: IntrinsicHeight(
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: [
      //         Container(width: 50, height: 120, color: Colors.red,),
      //         Container(width: 50, height: 60, color: Colors.green,),
      //         Container(width: 50, height: 420, color: Colors.blue,),
      //       ],
      //     ),
      //   ),
      // ),

      // Wrap widget
      // body: Wrap(
      //   // spacing: 12,
      //   // runSpacing: 12,
      //   // alignment: WrapAlignment.spaceAround,
      //   // direction: Axis.vertical,
      //   children: [
      //     Container(width: 120, height: 120, color: Colors.green,),
      //     Container(width: 120, height: 120, color: Colors.red,),
      //     Container(width: 120, height: 120, color: Colors.yellow,),
      //     Container(width: 120, height: 120, color: Colors.black,),
      //     Container(width: 120, height: 120, color: Colors.blue,),
      //   ],
      // ),

      // Spacer
      // body: Column(
      //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Container(width: 120, height: 120, color: Colors.red,),
      //     const Spacer(flex: 3,),
      //     Container(width: 120, height: 120, color: Colors.green,),
      //     const Spacer(flex: 1,),
      //   ],
      // ),

      // Виджеты более низкоуровневые
      // https://api.flutter.dev/flutter/widgets/CustomMultiChildLayout-class.html
      // https://api.flutter.dev/flutter/widgets/Flow-class.html

      // Виджет не отражает ориентацию устройства/экрана, а отражает ширину родителя больше, чем его высота.
      // body: OrientationBuilder(
      //   builder: (BuildContext context, Orientation orientation) {
      //     return orientation == Orientation.landscape ?
      //       Container(width: 120, height: 120, color: Colors.red,) :
      //       Container(width: 220, height: 220, color: Colors.green,);
      //   },
      // ),

      // body: LayoutBuilder(
      //   builder: (BuildContext context, BoxConstraints constraints) {
      //     final isLarge = constraints.maxWidth > 575;
      //     return Center(
      //       child: Container(
      //         width: isLarge ? 220 : 120,
      //         height: isLarge ? 220 : 120,
      //         decoration: BoxDecoration(
      //           color: isLarge ? Colors.red : Colors.green,
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

