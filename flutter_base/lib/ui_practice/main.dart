import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import './data.dart';

// https://www.figma.com/community/file/1066297521119881605?preview=fullscreen
// https://i.pravatar.cc/200

abstract class AppColors {
  static const Color mainBgColor = Color.fromRGBO(27, 32, 45, 1);
  static const Color secondaryBgColor = Color.fromRGBO(41, 47, 63, 1);

  static const Color inputMsgBgColor = Color.fromRGBO(55, 62, 78, 1);
  static const Color outputMsgBgColor = Color.fromRGBO(122, 129, 148, 1);

  static const Color textPrimaryColor = Colors.white;
  static const Color textSecondaryColor = Color.fromRGBO(179, 185, 201, 1);
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

  static const TextStyle hint = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondaryColor,
  );
}

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

class _ChatMsg extends StatelessWidget {
  final ChatItemMessageModel msgData;
  const _ChatMsg({Key? key, required this.msgData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _widthStage = MediaQuery.of(context).size.width;
    double _maxWidth = _widthStage * 0.80;
    final Color _bgColot = msgData.type == MessageType.input
        ? AppColors.inputMsgBgColor
        : AppColors.outputMsgBgColor;
    final AlignmentGeometry _aligment = msgData.type == MessageType.input
        ? Alignment.topLeft
        : Alignment.topRight;
    final TextAlign _textAlign =
        msgData.type == MessageType.input ? TextAlign.left : TextAlign.right;
    // final
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            width: _widthStage,
            alignment: _aligment,
            child: Container(
              constraints: BoxConstraints(maxWidth: _maxWidth),
              decoration: BoxDecoration(
                  color: _bgColot, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 12, left: 20, right: 20, top: 12),
                  child: Text(
                    msgData.text,
                    textAlign: _textAlign,
                    style: AppTextStyle.label,
                  )),
            )));
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
              child: ListView.builder(
                  reverse: true,
                  itemBuilder: ((context, index) {
                    final ChatItemMessageModel msgItem =
                        mockMessagesList[index];
                    final bool isNewDate = index == 0 ||
                        msgItem.date != mockMessagesList[index - 1].date;
                    if (isNewDate) {
                      return Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(msgItem.date,
                                  style: AppTextStyle.label)),
                          _ChatMsg(msgData: msgItem)
                        ],
                      );
                    } else {
                      return Column(
                        children: [_ChatMsg(msgData: msgItem)],
                      );
                    }
                  }),
                  itemCount: mockMessagesList.length)),
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
                          hintStyle: AppTextStyle.hint,
                          border: InputBorder.none,
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
