import 'dart:ui';

import 'package:flutter/material.dart';
import './data.dart';

// https://www.figma.com/community/file/1066297521119881605?preview=fullscreen
// https://i.pravatar.cc/200

abstract class AppColors {
  static const Color mainBgColor = Color.fromRGBO(27, 32, 45, 1);
  static const Color secondaryBgColor = Color.fromRGBO(41, 47, 63, 1);
  static const Color textPrimaryColor = Colors.white;
  static const Color textSecondaryColor = Color.fromRGBO(179, 185, 201, 1);
  static const Color outgoingColor = Color.fromRGBO(122, 129, 148, 1);
  static const Color incomingColor = Color.fromRGBO(55, 62, 78, 1);


}

abstract class AppTextStyle {
  static const TextStyle heading = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 28.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle subHeader = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondaryColor,
    letterSpacing: 5,
  );

  static const TextStyle label = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle accent = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle accentL = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondaryColor,
  );


  static const TextStyle dateLabel = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.0,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle message = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryColor,
  );
}




final List<List<String>> messagesList = [
  ['01 FEB 12:00','I commented on Figma, I want to add some fancy icons. Do you have any icon set?','in'],
  ['','I am in a process of designing some. When do you need them?','out'],
  ['','Next month?','in'],
  ['08:12','I am almost finish. Please give me your email, I will ZIP them and send you as son as im finish.','out'],
  ['','?','out'],
  ['08:43','maciej.kowalski@email.com','in'],
  ['','👍','out'],


];


void main() {
  runApp(
    MaterialApp(
      home: ChatAppDemo(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainBgColor,
          elevation: 0,
        ),
        scaffoldBackgroundColor: AppColors.mainBgColor,
      ),
    ),
  );
}

class ChatAppDemo extends StatelessWidget {
  const ChatAppDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            expandedHeight: 220,
            floating: true,
            pinned: true,
            snap: false,
            title: const Text(
              "Messages",
              style: AppTextStyle.heading,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 36,
                  ),
                ),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(
                  top: 110,
                  left: 14,
                  right: 14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "RECENT",
                      style: AppTextStyle.subHeader,
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return _UserRecent(user: resentUsersList[index]);
                        },
                        itemCount: resentUsersList.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 40,
              decoration: const BoxDecoration(
                color: AppColors.secondaryBgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _ChatListItem(
                  user: usersList[index],
                );
              },
              childCount: usersList.length,
            ),
          )
        ],
      ),
    );
  }
}

class _UserRecent extends StatelessWidget {
  const _UserRecent({Key? key, required this.user}) : super(key: key);

  final UserItemModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(34),
            child: Image.network(
              user.avatar,
              width: 65,
              height: 65,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            user.name,
            style: AppTextStyle.label,
          )
        ],
      ),
    );
  }
}

class _ChatListItem extends StatelessWidget {
  const _ChatListItem({Key? key, required this.user}) : super(key: key);

  final UserItemModel user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetail(),
          ),
        );
      },
      child: Container(
        color: AppColors.secondaryBgColor,
        padding: const EdgeInsets.only(
          left: 14,
          right: 14,
          bottom: 20,
          top: 12,
        ),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(4, 4),
                  blurRadius: 24,
                  spreadRadius: 0,
                )
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: Image.network(
                  user.avatar,
                  width: 52,
                  height: 52,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: AppTextStyle.accent,
                  ),
                  Text(
                    user.lastMessage,
                    style: AppTextStyle.accentL,
                  ),
                ],
              ),
            ),
            Container(
              height: 38,
              child: const Text(
                "20:18",
                style: AppTextStyle.accentL,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatDetail extends StatelessWidget {
  const ChatDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.network(
                "https://i.pravatar.cc/200",
                width: 44,
                height: 44,
              ),
            ),
            SizedBox(
              width: 14,
            ),
            const Text(
              "Danny Hopkins",
              style: AppTextStyle.heading2,
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 36,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: messagesList.length,
              separatorBuilder: (context, index) {
                if (messagesList[index][0]!='') {
                  return Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                      ),
                      child:  Text(messagesList[index][0], style: AppTextStyle.dateLabel),
                  );
                }
                return const SizedBox.shrink();
              },
              itemBuilder: (context, index) {
                if (index == 0) return const SizedBox.shrink();
                return (messagesList[index-1][2]== 'in')
                    ? Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.3,
                        left: 30.0,
                        top: 6.0,
                        bottom: 6.0),
                    decoration: BoxDecoration(
                      color: AppColors.incomingColor,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
                      child:  Text(
                        messagesList[index-1][1],
                        style: AppTextStyle.message,
                        textAlign: TextAlign.left,
                      )
                    ),
                  ),
                ):
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(
                        right: 30.0,
                        left: MediaQuery.of(context).size.width * 0.3,
                        top: 6.0,
                        bottom: 6.0),
                    decoration: BoxDecoration(
                      color: AppColors.outgoingColor,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0,
                          right: 12.0,
                          top: 8.0,
                          bottom: 8.0),
                      child: Text(
                        messagesList[index-1][1],
                        style: AppTextStyle.message,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                );
              },
             ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 14,
              right: 14,
              bottom: 50,
              top: 10,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.secondaryBgColor,
              ),
              height: 46,
              padding: const EdgeInsets.only(
                left: 6,
                right: 6,
                top: 8,
                bottom: 8,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: 33,
                      height: 33,
                      color: AppColors.textSecondaryColor,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Message",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.send,
                      size: 20,
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
