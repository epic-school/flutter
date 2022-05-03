import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(
    home: ParseTextData(),
  ));
}

class CityModel {
  late String name;
  late int id;

  CityModel({ required this.name, required this.id });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      name: json['name'],
      id: json['id'],
    );
  }
}

class ParseTextData extends StatefulWidget {
  const ParseTextData({Key? key}) : super(key: key);

  @override
  State<ParseTextData> createState() => _ParseTextDataState();
}

class _ParseTextDataState extends State<ParseTextData> {
  List<CityModel> data = [];

  loadJson() async {
    String rawJson = await rootBundle.loadString('assets/json/data.json');
    final jsonResult = json.decode(rawJson);
    final cities = jsonResult["cities"] as List;
    setState(() {
      data = cities.map((e) => CityModel.fromJson(e)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            final activeItem = data[index];
            return ListTile(
              title: Text(activeItem.name),
            );
          }
        ),
      ),
    );
  }
}
