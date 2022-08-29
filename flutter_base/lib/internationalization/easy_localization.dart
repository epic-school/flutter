import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

// https://pub.dev/packages/easy_localization

// class MyOwnAssetLoader extends AssetLoader {
//   @override
//   Future<Map<String, dynamic>> load(String path, Locale locale) async {
//     if (locale.countryCode == 'RU') {
//       return { 'title': "Заголовок", "localization": "Простая локализация"};
//     }
//     return { 'title': "Simple title", "localization": "Easy localization" };
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/translations',
      // assetLoader: MyOwnAssetLoader(),
      child: const DemoApp(),
    ),
  );
}

class DemoApp extends StatelessWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localizations App',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const LocalizedScreen(),
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
        title: const Text("localization").tr(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text(context.locale.countryCode.toString()),
        onPressed: () {
          if (context.locale.countryCode == 'RU') {
            context.setLocale(const Locale('en', 'US'));
            return;  
          }
          context.setLocale(const Locale('ru', 'RU'));
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('gender').tr(gender: 'female', namedArgs: { 'name': 'Имя' }),
          const Text('title').tr(),
          const Text('money').plural(1000000, format: NumberFormat.compact(locale: context.locale.toString()))
        ],
      ),
    );
  }
}
