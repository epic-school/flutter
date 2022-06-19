import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_service.dart';
import 'bloc/movie_bloc.dart';
import 'screens/movie_screen.dart';
import 'theme/theme.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await SharedPreferences.getInstance();

    final service = ApiServiceDio.instance;

    GetIt.I.registerSingleton<MovieBloc>(
      MovieBloc(
        storage: storage,
        service: service,
      )..add(LoadMovieEvent()),
    );


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
        navigatorKey: navKey,
        themeMode: state.theme,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black.withOpacity(0.95),
              fontSize: 18.0,
            ),
          ),
          iconTheme: const IconThemeData(
              color: Colors.red
          ),
          primaryIconTheme: const IconThemeData(
              color: Colors.black
          ),

            dividerTheme: const DividerThemeData(
            color: Colors.black
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
          iconTheme: const IconThemeData(
            color: Colors.white
         ),
          primaryIconTheme: const IconThemeData(
              color: Colors.white
          ),
            dividerTheme: const DividerThemeData(
              color: Colors.white
          ),
          textTheme: TextTheme(
            headline3: TextStyle(
              color: Colors.white.withOpacity(0.95),
            ),
            headline6: TextStyle(
              color: Colors.white.withOpacity(0.95),
            ),
            subtitle1: TextStyle(
              color: Colors.white.withOpacity(0.95),
            ),
          ),
          scaffoldBackgroundColor: const Color.fromRGBO(11, 11, 15, 1.0),
          switchTheme: SwitchThemeData(
            thumbColor: MaterialStateProperty.all(Colors.white12),
            trackColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        home:  const MovieScreen(),
      );
    }));
  }
}






