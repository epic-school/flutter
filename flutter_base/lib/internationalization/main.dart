import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:intl/intl.dart';

// Детальней про формат .arb
// https://localizely.com/flutter-arb/

void main() {
  runApp(const InterApp());
}

class InterApp extends StatelessWidget {
  const InterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( 
      title: 'Localizations App',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('ru', ''),
      ],
      locale: Locale('en'),
      home: LocalizedScreen()
    );
  }
}

class LocalizedScreen extends StatelessWidget {
  const LocalizedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final lng = AppLocalizations.of(context)!.localeName;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
      ),
      body: Column(
        children: [
          // Text(AppLocalizations.of(context)!.itemTotal(20)),
          // Text(AppLocalizations.of(context)!.date(DateTime.now())),
          // Text(DateFormat('yMMMd', AppLocalizations.of(context)!.localeName).format(DateTime.now())),
          // Image.asset('assets/images/$lng/img.png')
        ],
      ),
    );
  }
}