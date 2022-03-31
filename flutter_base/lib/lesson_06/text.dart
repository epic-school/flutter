import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: FullContainer(),
        // body: LinesText(),
        // body: RText(),
      ),
    );
  }
}

class FullContainer extends StatelessWidget {
  const FullContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350.0,
        height: 350.0,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.indigo,
              border: Border.all(
                color: Colors.white,
                width: 5.0,
              ),
              // borderRadius: BorderRadius.circular(20.0),
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Colors.indigo,
                  Colors.indigoAccent,
                ],
              ),
            ),
            child: const Text(
              'АЗ',
              style: TextStyle(
                // backgroundColor: Colors.black,
                // fontStyle: FontStyle.italic,
                // letterSpacing: 10.0,
                // textBaseline: TextBaseline.alphabetic,
                // height: 1.0,
                color: Colors.white,
                fontSize: 62.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LinesText extends StatelessWidget {
  const LinesText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 200.0,
        height: 100.0,
        child: Text(
          'По своей сути рыбатекст является альтернативой традиционному lorem ipsum, который вызывает у некторых людей недоумение при попытках прочитать рыбу текст',
          // textAlign: TextAlign.center,
          // textScaleFactor: 2.0,
          maxLines: 3,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class RText extends StatelessWidget {
  const RText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300.0,
        height: 50.0,
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: 'Вы можете перейти по ',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'ссылке',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
