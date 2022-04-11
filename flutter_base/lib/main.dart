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
        body: Vizitka(),
      ),
    );
  }
}

class Vizitka extends StatelessWidget {
  const Vizitka({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: Card(
          color: Color.fromARGB(1, 135, 135, 135),
          child: soderzhanie(),
        ),
      ),
    );
  }
}

class soderzhanie extends StatelessWidget {
  const soderzhanie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.mycdn.me/i?r=AzEPZsRbOZEKgBhR0XGMT1Rkbhi-oMFkToNuShgW1E6swqaKTM5SRkZCeTgDn6uOyic'),
                radius: 50,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Степан Иванов',
                          style: TextStyle(fontSize: 26)),
                      const Text('flutter-разработчик'),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.contacts,
                                  size: 12,
                                  color: Color.fromARGB(255, 54, 82, 244)),
                              Text(' Github ', style: TextStyle(fontSize: 14)),
                              Text('@StepanIvanov'),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.contact_mail,
                                  size: 12,
                                  color: Color.fromARGB(255, 54, 82, 244)),
                              Text(' Telegran ',
                                  style: TextStyle(fontSize: 14)),
                              Text('@Stepan12'),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 10,
          thickness: 0.5,
          indent: 20,
          endIndent: 20,
          color: Color.fromARGB(255, 37, 37, 37),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              tabloid(
                  nameiNg: 'зарплата',
                  namiN2: 'от 200000 ',
                  icon: Icons.money_rounded),
              tabloid(
                  nameiNg: 'опыт работы',
                  namiN2: '2 года',
                  icon: Icons.money_rounded),
              tabloid(
                  nameiNg: 'релокация',
                  namiN2: 'Чебаркуль',
                  icon: Icons.money_rounded),
            ],
          ),
        ),
      ],
    );
  }
}

class tabloid extends StatelessWidget {
  final String nameiNg;
  final String namiN2;
  final IconData icon;
  const tabloid({
    Key? key,
    required this.nameiNg,
    required this.namiN2,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(icon, size: 40, color: Color.fromARGB(255, 91, 91, 91)),
          Text(nameiNg, style: TextStyle(fontSize: 16)),
          Text('$namiN2', style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
