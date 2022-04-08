import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);
  final String _name = 'Переверзев Алексей';
  final String _position = 'Flutter-разработчик';

  final String _avatar = 'lib/hw_lesson_07/assets/img/my_dash.png';
  final String _backImg = 'lib/hw_lesson_07/assets/img/bwf.png';

  final String _github = '@perzend';
  final String _telegram = '@bosspahan';

  final int _salary = 120000;
  final String _salaryCurrency = '\u20BD';
  final int _experience = 1;
  final String _experienceOld = 'год';
  final String _relocation = 'Не интересно';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Business Card',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tap on card'),
          centerTitle: true,
          backgroundColor: Colors.blue.shade200,
          shadowColor: Colors.blue.shade50,
        ),
        body: Center(
          child: FlipCard(
            direction: FlipDirection.HORIZONTAL,
            front: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue.shade50, Colors.blue.shade200]),
                  borderRadius: BorderRadius.circular(16)),
              width: 300,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Avatar(imgPath: _avatar),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          Text(_position,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 16)),
                          const SizedBox(height: 10),
                          Contacts(
                              icon: Icons.repeat,
                              title: 'GitHub',
                              option: _github),
                          Contacts(
                              icon: Icons.telegram,
                              title: 'Telegram',
                              option: _telegram),
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(thickness: 2),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OptionInfo(
                          icon: Icons.attach_money,
                          title: 'Зарплата',
                          option: 'от $_salary $_salaryCurrency'),
                      OptionInfo(
                          icon: Icons.star,
                          title: 'Опыт',
                          option: '$_experience $_experienceOld'),
                      OptionInfo(
                          icon: Icons.airplanemode_active,
                          title: 'Релокация',
                          option: _relocation)
                    ],
                  ),
                ],
              ),
            ),
            back: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue.shade200, Colors.blue.shade50]),
                  borderRadius: BorderRadius.circular(16)),
              width: 300,
              height: 200,
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                _backImg,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final String imgPath;

  const Avatar({
    Key? key,
    required this.imgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.deepOrangeAccent,
          ),
          boxShadow: const [
            BoxShadow(
                color: Colors.deepOrangeAccent,
                blurRadius: 8.0,
                blurStyle: BlurStyle.outer)
          ],
          color: Colors.transparent,
          image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
        ));
  }
}

class OptionInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String option;

  const OptionInfo(
      {Key? key, required this.icon, required this.title, required this.option})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.deepOrangeAccent,
          size: 42,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(option,
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14)),
      ],
    );
  }
}

class Contacts extends StatelessWidget {
  final IconData icon;
  final String title;
  final String option;

  const Contacts(
      {Key? key, required this.icon, required this.title, required this.option})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.teal,
          size: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          '$title: $option',
          style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
        ),
      ],
    );
  }
}
