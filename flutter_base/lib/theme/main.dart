import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.green;
                }
                return Colors.red;
              },
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Кнопка'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Кнопка 2'),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.black;
                  }
                  return Colors.white;
                },
              )),
            ),
            ElevatedButtonTheme(
              data: ElevatedButtonThemeData(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.amber;
                      }
                      return Colors.black;
                    },
                  ),
                ),
              ),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Кнопка 3'),
              ),
            ),
            Text(
              'Обычный текст',
              style: theme.textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}

const textStyleBody = TextStyle(
  color: Colors.black,
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
);

final widget = Text(
  'BodyText',
  style: textStyleBody.copyWith(
    color: Colors.red,
  ),
);
