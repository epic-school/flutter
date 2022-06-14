import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../domain/entities/day.dart';
import '../domain/repository/day_repository_interface.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var repo = GetIt.instance.get<DayRepositoryInterface>();

  var latController = TextEditingController();
  var lonController = TextEditingController();

  Day? _day;

  bool _loading = false;

  String _error = "";

  Future _getData() async {
    if(_loading) return;

    setState(() {
      _loading = true;
      _error = "";
      _day = null;
    });

    var lat = double.tryParse(latController.text);
    var lon = double.tryParse(lonController.text);

    if(lat == null || lon == null) {
      _error = "Неверный формат данных";
    } else {
      // try {
        _day = await repo.getDay(latitude: lat, longitude: lon);
      // } catch (_) {
      //   _error = "Ошибка при получении данных";
      // }
    }

    setState(() {
      _loading = false;
    });
  }

  Widget _getResultWidget() {
    Widget? result;

    if(_loading) {
      result = const Expanded(child: Center(child: CircularProgressIndicator()));
    }

    if(!_loading && _day != null) {
      result = Column(
        children: [
          Text("Day length: ${_day?.dayLength}"),
          Text("Solar noon: ${_day?.solarNoon}"),
          Text("Sunrise: ${_day?.sunrise}"),
          Text("Sunset: ${_day?.sunset}"),
        ],
      );
    }

    if(_error.isNotEmpty) {
      result = Text(_error, style: const TextStyle(color: Colors.red));
    }

    result ??= const SizedBox.shrink();

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sunrise Sunset")),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextField(decoration: const InputDecoration(border: OutlineInputBorder()), controller: latController,)),
              Expanded(child: TextField(decoration: const InputDecoration(border: OutlineInputBorder()), controller: lonController)),
            ],
          ),
          MaterialButton(
            onPressed: () => _getData(),
            child: const Text("Get data"),
            color: Colors.purple,
            textColor: Colors.white
          ),
          _getResultWidget()
        ],
      )
    );
  }
}
