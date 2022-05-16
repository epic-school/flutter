import 'package:pixel_perfect/pixel_perfect.dart';
import 'package:flutter/material.dart';

const imagePath = 'assets/images/';

void main(List<String> args) {
  runApp(const ResumeCardApp());
}

class ResumeCardApp extends StatelessWidget {
  const ResumeCardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Card(),
    );
  }
}

//home: const PixelPerfect(assetPath: imagePath + 'cardDis.jpg', child: Card()));

class Card extends StatelessWidget {
  const Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PixelPerfect(
        scale: 1.63,
        assetPath: imagePath + 'cardDis.jpg',
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Карточка соискателя',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
            centerTitle: true,
          ),
          body: Center(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color.fromARGB(255, 216, 212, 212),
              ),
              width: double.infinity,
              height: 230,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Column(
                children: const [
                  TopBlock(),
                  BootomBlock(),
                ],
              ),
            ),
          ),
        ));
  }
}

class TopBlock extends StatelessWidget {
  const TopBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 118,
      child: Row(children: const [Ava(), Expanded(child: PersonInfo())]),
    );
  }
}

class Ava extends StatelessWidget {
  const Ava({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        height: double.infinity,
        //color: Colors.deepOrangeAccent,
        margin: const EdgeInsets.only(right: 15),
        child: Transform(
            transform: Matrix4.translationValues(-8, -8, 0),
            child: const Icon(
              Icons.account_circle_rounded,
              color: Colors.grey,
              size: 126,
            )));
  }
}

class PersonInfo extends StatelessWidget {
  const PersonInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: double.infinity,
      //color: const Color.fromARGB(255, 134, 114, 136),
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Expanded(
          child: SizedBox(
              width: double.infinity,
              height: 100,
              //color: const Color.fromARGB(255, 0, 212, 109),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Иванов Иван',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'flutter-разработчик',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  )
                ],
              )),
        ),
        Expanded(
            child: Container(
                width: double.infinity,
                height: 100,
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    NetReff(
                        icon: Icon(
                          Icons.account_tree,
                          color: Colors.black,
                          size: 12,
                        ),
                        netName: 'Github',
                        nickName: '@ivanov.ivan'),
                    NetReff(
                        icon: Icon(
                          Icons.send,
                          size: 12,
                        ),
                        netName: 'Telegram',
                        nickName: '@ivanivanov1'),
                  ],
                ))),
      ]),
    );
  }
}

class NetReff extends StatelessWidget {
  final Icon icon;
  final String netName;
  final String nickName;

  const NetReff(
      {Key? key,
      required this.netName,
      required this.nickName,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(padding: const EdgeInsets.only(right: 7), child: icon),
        Text(
          '$netName: $nickName',
          style: const TextStyle(fontSize: 15),
        )
      ],
    );
  }
}

class BootomBlock extends StatelessWidget {
  const BootomBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 92,
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey))),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Skill(
                  icon: Icon(
                    Icons.attach_money,
                    color: Colors.grey,
                    size: 50,
                  ),
                  title: 'Зарплата',
                  subTitle: 'от 5000\$',
                ),
                Skill(
                  icon: Icon(
                    Icons.star,
                    color: Colors.grey,
                    size: 50,
                  ),
                  title: 'Опыт',
                  subTitle: '10 лет',
                ),
                Skill(
                  icon: Icon(
                    Icons.airplanemode_active,
                    color: Colors.grey,
                    size: 50,
                  ),
                  title: 'Релокация',
                  subTitle: 'Не интересно',
                )
              ]),
        ));
  }
}

class Skill extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subTitle;
  const Skill({
    Key? key,
    required this.icon,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 1),
          child: icon,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          subTitle,
          style: const TextStyle(fontSize: 14),
        )
      ],
    );
  }
}
