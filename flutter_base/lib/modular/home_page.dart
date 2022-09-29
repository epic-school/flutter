import 'package:flutter/material.dart';
import 'package:flutter_base/modular/mail_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My AppBar"),),
      body: Column(
        children: [
          MaterialButton(onPressed: () => Modular.to.pushNamed('/comments', arguments: {
            'list': ["A","B","C"]
          }), child: Text("Go to comments"), color: Colors.purple,),
          MaterialButton(onPressed: () => Modular.to.pushNamed('/user/23473294738', ), child: Text("Go to user"), color: Colors.purple,),
          MaterialButton(onPressed: () => Modular.to.pushNamed('/profile', ), child: Text("Go to profile"), color: Colors.purple,),
          MaterialButton(onPressed: () => Modular.to.pushNamed('/nested/', ), child: Text("Go to nested"), color: Colors.purple,),
        ],
      )
    );
  }
}
