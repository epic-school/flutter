import 'package:flutter/material.dart';

import '../screens/favorite_screen.dart';
import '../screens/movie_screen.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
         const UserAccountsDrawerHeader(
            accountName:  Text('kotelnikov-aa'),
            accountEmail: Text('aleksey@kotelnikov.org'),
            decoration:  BoxDecoration(
              color: Colors.blue,
            ),
          ),
           ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Кинопремьеры'),
            onTap: () =>   Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MovieScreen()))
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Закладки"),
              onTap: () =>   Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FavoriteScreen()))
          ),

        ],
      ),
    );
  }
}