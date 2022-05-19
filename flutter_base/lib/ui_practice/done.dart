import 'package:flutter/material.dart';
import './data.dart';

// https://www.figma.com/community/file/1066297521119881605?preview=fullscreen
// https://i.pravatar.cc/200

class AppColors {
  static const secondaryColor = Color.fromRGBO(41, 47, 63, 1);
  static const thirdColor = Color.fromRGBO(61, 67, 84, 1);
  static const thirdLightColor = Color.fromRGBO(147, 152, 167, 1);
  static const bgColor = Color.fromRGBO(24, 32, 45, 1);
  static const black058 = Color.fromRGBO(255, 255, 255, 0.58);
}

class AppTextStyle {
  static TextStyle heading = const TextStyle(
    color: Colors.white,
    fontSize: 28.0,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static TextStyle subHeader = const TextStyle(
    color: AppColors.black058,
    fontSize: 13.0,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    letterSpacing: 6,
  );

  static TextStyle label = const TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle accent = const TextStyle(
    color: Colors.white,
    fontSize: 15.0,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static TextStyle accentL = const TextStyle(
    color: AppColors.black058,
    fontSize: 14.0,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle appBarTitle = const TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
}

void main() {
  runApp(MaterialApp(
    home: const ChatAppDemo(),
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.dark,
    theme: ThemeData.light(),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
      ),
      scaffoldBackgroundColor: AppColors.bgColor,
    ),
  ));
}

class ChatAppDemo extends StatelessWidget {
  const ChatAppDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            snap: false,
            expandedHeight: 220,
            title: Text(
              "Messages",
              style: AppTextStyle.heading,
            ),
            centerTitle: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
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
                    Text("RECENT", style: AppTextStyle.subHeader),
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          resentUsersList.length,
                          (index) => _UserRecent(user: resentUsersList[index]),
                        ),
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
                color: AppColors.secondaryColor,
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
          ),
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
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              user.avatar,
              width: 65,
              height: 65,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            user.name,
            style: AppTextStyle.label,
          ),
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
          MaterialPageRoute(builder: (context) => const ChatPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 14,
          right: 14,
          bottom: 20,
          top: 10,
        ),
        color: AppColors.secondaryColor,
        clipBehavior: Clip.none,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                borderRadius: BorderRadius.circular(28),
                child: Image.network(
                  user.avatar,
                  width: 52,
                  height: 52,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
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
              height: 40,
              child: Text(
                "20:20",
                style: AppTextStyle.accentL,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

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
            const SizedBox(
              width: 16,
            ),
            Text("Danny Hopkins", style: AppTextStyle.appBarTitle)
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
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
              itemBuilder: (context, index) {
                return _ChatMessage(isMy: index == 6);
              },
              separatorBuilder: (context, index) {
                if (index != 4) {
                  return Container();
                }
                return Center(
                  child: Text("123", style: AppTextStyle.accent),
                );
              },
              itemCount: 120,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 40,
              top: 10,
              left: 14,
              right: 14,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: AppColors.secondaryColor,
              ),
              height: 46,
              width: 400,
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 6,
                bottom: 6,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: AppColors.thirdLightColor,
                      width: 33,
                      height: 33,
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const TextField(
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          hintText: 'Message',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 33,
                    height: 33,
                    child: const Icon(
                      Icons.send,
                      color: AppColors.thirdLightColor,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ChatMessage extends StatelessWidget {
  const _ChatMessage({Key? key, this.isMy = false}) : super(key: key);

  final bool isMy;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMy ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMy ? AppColors.thirdLightColor : AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 12,
            bottom: 12,
          ),
          margin: const EdgeInsets.only(
            bottom: 12,
            right: 14,
            left: 14,
          ),
          child: const Text(
            "Some message",
            maxLines: 30,
          ),
        )
      ],
    );
  }
}
