import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My profile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350.0,
              height: 256.0,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _EmptyAvatar(),
                        Padding(padding: const EdgeInsets.only(left:10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Иванов Иван',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Flutter-разработчик',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top:10.0),
                                child: _Contact(contact:'GitHub: @123.12'),
                              ),
                              _Contact(contact:'Telegram: @123.12'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
                      child: Container(
                        width: 345.0,
                        height: 3.0,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        _Condition(h1:'Зарплата', h2: 'от 50000 RUB', indexIcon: 0,),
                        _Condition(h1:'Опыт', h2: '100 лет',indexIcon: 1,),
                        _Condition(h1:'Релокация', h2: 'За ваш счёт',indexIcon: 2,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyAvatar extends StatelessWidget {

  const _EmptyAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 113.0,
      height: 113.0,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.black26,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Contact extends StatelessWidget {
  final String contact;

  const _Contact({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        const Icon(Icons.input),
        Padding(padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            contact,
            style:const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class _Condition extends StatelessWidget {
  final String h1;
  final String h2;
  final int indexIcon;


  const _Condition({
    Key? key,
    required this.h1,
    required this.h2,
    required this.indexIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [ indexIcon==0 ?
      const Icon(Icons.money,size: 50.0,):
      indexIcon==1 ? const Icon(Icons.star,size: 50.0,):
      const Icon(Icons.place,size: 50.0,),
        Text(
          h1,
          style:const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          h2,
          style:const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}