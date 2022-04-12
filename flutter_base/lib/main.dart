import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 235, 235, 235),
            borderRadius: BorderRadius.circular(8.0),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              MainRowRenderer(),
              Divider(),
              FeaturesRowRenderer(),
            ],
          ),
        ),
      ),
    );
  }
}

class MainRowRenderer extends StatelessWidget {
  const MainRowRenderer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 198, 198, 198),
            shape: BoxShape.circle,
          ),
        ),
        const UserDataRenderer(),
      ],
    );
  }
}

class UserDataRenderer extends StatelessWidget {
  const UserDataRenderer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Иванов Иван',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Flutter-разработчик',
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
          ),
          const Divider(
            height: 10.0,
          ),
          Row(
            children: const [
              Icon(Icons.arrow_right_sharp),
              Text('GitHub: @ivanov.ivan'),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.arrow_right_sharp),
              Text('Telegram: @ivanovivan1'),
            ],
          ),
        ],
      ),
    );
  }
}

class FeaturesRowRenderer extends StatelessWidget {
  const FeaturesRowRenderer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FeatureItem(
          icon: Icons.attach_money,
          title: 'Зарплата',
          subTitle: 'от 5000\$',
        ),
        FeatureItem(
          icon: Icons.star,
          title: 'Опыт',
          subTitle: '10 лет',
        ),
        FeatureItem(
          icon: Icons.local_airport,
          title: 'Релокация',
          subTitle: 'Не интересно',
        ),
      ],
    );
  }
}

class FeatureItem extends StatelessWidget {
  IconData icon;
  String title;
  String subTitle;

  FeatureItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color.fromARGB(255, 121, 121, 121),
          size: 60,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        Text(subTitle),
      ],
    );
  }
}
