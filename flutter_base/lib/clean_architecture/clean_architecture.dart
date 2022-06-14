import 'package:flutter/material.dart';
import 'package:flutter_base/clean_architecture/data/providers/sunrise_provider.dart';
import 'package:flutter_base/clean_architecture/domain/repository/day_repository.dart';
import 'package:flutter_base/clean_architecture/view/main_screen.dart';
import 'package:get_it/get_it.dart';

import 'domain/repository/day_repository_interface.dart';


void main() async {
  setup();

  runApp(const MyApp());
}

void setup() {
  var _provider = SunriseProvider();

  GetIt.I.registerFactory<DayRepositoryInterface>(() => DayRepository(_provider));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}
