import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: CardView(),
      ),
    );
  }
}

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: Card(
          color: Colors.white38,
          child: Content(),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  shape: BoxShape.circle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Котельников Алексей',
                        style: TextStyle(fontSize: 24)),
                    const Text('Flutter-разработчик'),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.send,
                                size: 12),
                            Text(' Github: ', style: TextStyle(fontSize: 14)),
                            Text('@kotelnikov-aa'),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.send,
                                size: 12),
                            Text(' Telegram: ',
                                style: TextStyle(fontSize: 14)),
                            Text('@aleksey.a.kotelnikov'),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 12,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Item(
                  title: 'Зарплата',
                  value: 'от 50000 руб. ',
                  icon: Icons.attach_money),
              Item(
                  title: 'Опыт',
                  value: 'без опыта',
                  icon: Icons.grade),
              Item(
                  title: 'Релокация',
                  value: 'Не интересно',
                  icon: Icons.airplanemode_active),
            ],
          ),
        ),
      ],
    );
  }
}

class Item extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  const Item({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40,
            color: Colors.black26),
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        Text(value, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}