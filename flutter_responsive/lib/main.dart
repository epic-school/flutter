import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Responsive demo',
      home: ResponsiveLayout(),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300,
        height: 300,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(width: 100, height: 150, color: Colors.red),
            Container(width: 150, height: 150, color: Colors.green),
            Container(width: 150, height: 150, color: Colors.blue),
          ],
        ),
      )

      // body: LayoutBuilder(
      //   builder: (context, BoxConstraints constraints) {
      //     final width = constraints.maxWidth > 600 ? 300.0 : 200.0;
      //     final height = constraints.maxHeight > 400 ? 300.0 : 200.0;
      //     final color = constraints.maxWidth > 600 ? Colors.red : Colors.green;

      //     return Container(
      //       decoration: BoxDecoration(
      //         color: color,
      //       ),
      //       width: width,
      //       height: height,
      //     );
      //   },
      // ),


      // body: LayoutBuilder(
      //   builder: (context, constraints) {
      //     return Flex(
      //       direction: Axis.horizontal,
      //       children: [
      //         Flexible(
      //           flex: 5,
      //           fit: FlexFit.tight,
      //           child: Container(
      //             color: Colors.red,
      //             // height: 100,
      //           ),
      //         ),
              
      //         Flexible(
      //           flex: 2,
      //           child: Container(
      //             color: Colors.green,
      //             // height: 100,
      //           ),
      //         )
      //       ],
      //     );
      //   }
      // )
    );
  }
}