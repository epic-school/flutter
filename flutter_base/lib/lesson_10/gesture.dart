import 'dart:developer';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: GestureDemo(),
  ));
}

class GestureDemo extends StatefulWidget {
  const GestureDemo({Key? key}) : super(key: key);

  @override
  State<GestureDemo> createState() => _GestureDemoState();
}

class _GestureDemoState extends State<GestureDemo> {
  double dx = 0;
  double dy = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestures'),
      ),
      body: Stack(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                log('onTap');
                Feedback.forTap(context);
              },
              onLongPress: () {
                log('onLongPress');
                Feedback.forLongPress(context);
              },
              onDoubleTap: () {
                log('onDoubleTap');
                Feedback.forLongPress(context);
              },
              onHorizontalDragStart: (details) {
                log('${details.globalPosition.dx}');
              },
              onHorizontalDragUpdate: (details) {
                log('${details.globalPosition.dx}');
              },
              child: const Text('Gesture detector'),
            ),
          ),
          // Positioned(
          //   top: dy,
          //   left: dx,
          //   child: Draggable<String>(
          //     // data: 'Demo data',
          //     onDragEnd: (detalis) {
          //       setState(() {
          //         dx = detalis.offset.dx;
          //         dy = detalis.offset.dy - 80;
          //       });
          //     },
          //     child: Container(
          //       width: 120,
          //       height: 120,
          //       color: Colors.red,
          //     ),
          //     feedback: Container(
          //       width: 120,
          //       height: 120,
          //       color: Colors.black.withOpacity(0.6),
          //     ),
          //   )
          // ),

          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: DragTarget<String>(
          //     builder: (context, candidateData, rejectData) {
          //       return Container(
          //         color: Colors.orange.shade200,
          //         height: 300,
          //         child: const Center(child: Text("Drop"),),
          //       );
          //     },
          //     onWillAccept: (data) {
          //       log('Validate drag data ${data}');
          //       return true;
          //     },
          //     onAccept: (data) {
          //       log('Data accepted: $data');
          //     },
          //   )
          // )
        ],
      ),
    );
  }
}