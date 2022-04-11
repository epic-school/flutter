import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Card(),
    );
  }
}

class Card extends StatelessWidget {
  const Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Card"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 260.0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 150.0,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        height: 130.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Абхази Артём",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22.0),
                                ),
                                const Text(
                                  "Flutter-разработчик",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16.0,
                                      color: Colors.black45),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.arrow_forward),
                                      Text("Github: https://github.com/abkhazi")
                                    ],
                                  ),
                                ),
                                Row(
                                  children: const [
                                    Icon(Icons.arrow_forward),
                                    Text("Telegram: https://telegram.org")
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    )
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: const [
                        Icon(
                          Icons.attach_money,
                          size: 40.0,
                          color: Colors.blueGrey,
                        ),
                        Text(
                          "Зарплата",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w600),
                        ),
                        Text("от 500 \$",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: Colors.black45))
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(
                          Icons.star,
                          size: 40.0,
                          color: Colors.blueGrey,
                        ),
                        Text(
                          "Опыт",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w600),
                        ),
                        Text("1 месяц",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: Colors.black45))
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(
                          Icons.local_airport,
                          size: 40.0,
                          color: Colors.blueGrey,
                        ),
                        Text(
                          "Релокация",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w600),
                        ),
                        Text("Не интересно",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: Colors.black45))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
