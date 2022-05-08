// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeState(storage),
        )
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeState>(builder: ((context, state, child) {
      return MaterialApp(
        themeMode: state.theme,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black.withOpacity(0.95),
              fontSize: 18.0,
            ),
          ),
          textTheme: TextTheme(
            headline3: TextStyle(
              color: Colors.black.withOpacity(0.95),
            ),
          ),
          scaffoldBackgroundColor: const Color.fromRGBO(244, 244, 244, 1.0),
        ),
        darkTheme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.white.withOpacity(0.95),
              fontSize: 18.0,
            ),
          ),
          textTheme: TextTheme(
            headline3: TextStyle(
              color: Colors.white.withOpacity(0.95),
            ),
          ),
          scaffoldBackgroundColor: const Color.fromRGBO(11, 11, 15, 1.0),
          switchTheme: SwitchThemeData(
            thumbColor: MaterialStateProperty.all(Colors.yellow),
            trackColor: MaterialStateProperty.all(Colors.yellow[100]),
          ),
        ),
        home: const MainScreen(),
      );
    }));
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change theme',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          Switch(
            value: state.isDark,
            onChanged: (value) {
              if (value) {
                state.setDarkTheme();
              } else {
                state.setLightTheme();
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          "HOME PAGE",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}

class ThemeState with ChangeNotifier {
  final SharedPreferences storage;

  var _theme = ThemeMode.light;

  ThemeState(this.storage) {
    _theme = _getTheme();
  }

  ThemeMode get theme => _theme;

  bool get isDark => _theme == ThemeMode.dark;

  ThemeMode _getTheme() {
    final cache = storage.getString('theme') ?? '';

    if (cache.isEmpty || cache == 'light') {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

  void setLightTheme() {
    _change(ThemeMode.light);
  }

  void setDarkTheme() {
    _change(ThemeMode.dark);
  }

  void _change(ThemeMode value) {
    _theme = value;
    storage.setString('theme', _theme.name);
    notifyListeners();
  }
}
