import 'package:flutter/material.dart';

class DeveloperCard extends StatelessWidget {
  const DeveloperCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 300,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Header(),
          Bottom(),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Иванов Александр',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Flutter-разработчик',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(
                  Icons.double_arrow_rounded,
                ),
                Text(
                  'Github: @TheBestOfGeeks',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Icon(
                  Icons.double_arrow_rounded,
                ),
                Text(
                  'Telegram: @Alexander925',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }
}

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                Icons.add_circle_rounded,
                size: 70,
                color: Colors.grey,
              ),
              Text(
                'Зарплата',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              Text(
                'от 5000\$',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.star,
                size: 70,
                color: Colors.grey,
              ),
              Text(
                'Опыт',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              Text(
                '10 лет',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.airplanemode_active,
                size: 70,
                color: Colors.grey,
              ),
              Text(
                'Релокация',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              Text(
                'Не интересно',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
