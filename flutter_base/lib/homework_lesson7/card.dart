import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: const Scaffold(key: ValueKey("top"), body: Card()));
  }
}

class Card extends StatelessWidget {
  const Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [PersonalGrid(), Divider(thickness: 1), WishesGrid()]);
  }
}

class PersonalGrid extends StatelessWidget {
  const PersonalGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: Row(children: [
                  Padding (
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        child: Image.asset('images/avatar.jpg'), height: 200, width: 200),
                  ),
                  Flexible(
                      child: Padding (
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                              children: const [PersonalInfo(), ContactInfo()],
                              mainAxisAlignment: MainAxisAlignment.center)))
                ]));
  }
}

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      Text("Суханова Елизавета Александровна",
        style: TextStyle(fontWeight: FontWeight.bold)),
      Text("Java-разработчик")
    ], crossAxisAlignment: CrossAxisAlignment.start,);
  }
}

class ContactInfo extends StatelessWidget {
  const ContactInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
        ContactWidget(icon: Icon(Icons.send), resource: "Github", address: "Padmelina"),
        ContactWidget(icon: Icon(Icons.send), resource: "Telegram", address: "padmelina")
      ]);
  }
}

class ContactWidget extends StatelessWidget {
  final Icon icon;
  final String resource;
  final String address;

  const ContactWidget(
      {Key? key,
      required this.icon,
      required this.resource,
      required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: icon,
    ), Text("$resource: $address")]);
  }
}

class WishWidget extends StatelessWidget {
  final String wish;
  final String goal;
  final Icon icon;
  const WishWidget({Key? key,
    required this.wish,
    required this.goal,
    required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [Padding(padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child : icon),
      Text(wish, style: const TextStyle(fontWeight: FontWeight.bold)),
      Text(goal)]);
  }

}

class WishesGrid extends StatelessWidget {
  const WishesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: const [Expanded(
      child: WishWidget(wish : "Зарплата",
          goal : "250'000",
          icon: Icon(Icons.currency_ruble)),
    ),
      Expanded(
        child: WishWidget(wish : "Опыт",
            goal : "7 лет",
            icon: Icon(Icons.star)),
      ),
      Expanded(
        child: WishWidget(wish : "Релокация",
            goal : "Не интересует",
            icon: Icon(Icons.train)),
      )]);
  }

}
