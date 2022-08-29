import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const IntlDemoApp());
}

class IntlDemoApp extends StatelessWidget {
  const IntlDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      locale: Locale('ru'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('ru', ''),
      ],
      home: IntlDemo(),
    );
  }
}

class IntlDemo extends StatelessWidget {
  const IntlDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'ru_RU';

    final currencyFormat = NumberFormat.currency();
    final currencySimpleFormat = NumberFormat.simpleCurrency();
    final compactFormat = NumberFormat.compact();
    final percentPatternFormat = NumberFormat.percentPattern();
    final dateFormat = DateFormat.yMMMMEEEEd();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Intl demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Intl.message(
                'Any text message',
                name: 'continueMessage',
                args: [],
                desc:
                    'Explains that we will not proceed further until the user presses a key',
              ),
            ),
            // Text(
            //   Intl.plural(2, one: "Огурец", two: "Огурца", other: "Огурцы"),
            // ),
            // Text(
            //   Intl.select(
            //     'available',
            //     {'available': 'Доступен', 'unavailable': 'Не доступен'},
            //   ),
            // ),
            // Text(
            //   Intl.gender(
            //     'female',
            //     female: 'Текст для мистера',
            //     male: 'Текст для мисс',
            //     other: 'Текст хз',
            //   ),
            // ),
            // Text(
            //   currencyFormat.format(1234)
            // ),
            // Text(
            //   currencySimpleFormat.format(1234)
            // ),
            // Text(
            //   compactFormat.format(1234)
            // ),
            // Text(
            //   percentPatternFormat.format(0.2)
            // ),
            // Text(
            //   dateFormat.format(DateTime.now()),
            // )
          ],
        ),
      ),
    );
  }
}
