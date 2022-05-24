import 'package:flutter/material.dart';
import './data.dart';
import 'constants/app_colors.dart';
import 'constants/app_text_style.dart';

// https://www.figma.com/community/file/1066297521119881605?preview=fullscreen
// https://i.pravatar.cc/200

void main() {
  runApp(
    MaterialApp(
      home: const ChatAppDemo(),
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
            expandedHeight: 220.0,
            floating: true,
            pinned: true,
            snap: false,
            title: const Text(
              "Messages",
              style: AppTextStyle.heading,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 36.0,
                  ),
                ),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(
                  top: 110.0,
                  left: 14.0,
                  right: 14.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "RECENT",
                      style: AppTextStyle.subHeader,
                    ),
                    const SizedBox(height: 12.0),
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
              height: 40.0,
              decoration: const BoxDecoration(
                color: AppColors.secondaryBgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
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
      padding: const EdgeInsets.only(right: 30.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(34.0),
            child: Image.network(
              user.avatar,
              width: 65.0,
              height: 65.0,
            ),
          ),
          const SizedBox(height: 9.0),
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
            builder: (context) => const ChatDetail(),
          ),
        );
      },
      child: Container(
        color: AppColors.secondaryBgColor,
        padding: const EdgeInsets.only(
          left: 14.0,
          right: 14.0,
          bottom: 20.0,
          top: 12.0,
        ),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 24.0,
                  spreadRadius: 0,
                )
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26.0),
                child: Image.network(
                  user.avatar,
                  width: 52.0,
                  height: 52.0,
                ),
              ),
            ),
            const SizedBox(width: 20.0),
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
            const SizedBox(
              width: 16.0,
            ),
            const SizedBox(
              height: 38.0,
              child: Text(
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
              borderRadius: BorderRadius.circular(22.0),
              child: Image.network(
                "https://i.pravatar.cc/200",
                width: 44.0,
                height: 44.0,
              ),
            ),
            const SizedBox(
              width: 14.0,
            ),
            const Text(
              "Danny Hopkins",
              style: AppTextStyle.heading2,
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 36.0,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: messageList.length,
              separatorBuilder: (context, index) {
                if (index.isEven && index > 15 && index < 50 ||
                    index.isOdd && index > 70 && index < 100) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
                      child:
                          Text(dateList[index].date, style: AppTextStyle.date),
                    ),
                  );
                }
                if (index == 110) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 12.0, bottom: 8.0),
                      child: Text("08:12", style: AppTextStyle.date),
                    ),
                  );
                }
                if (index == 116) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 12.0, bottom: 8.0),
                      child: Text("08:43", style: AppTextStyle.date),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
              itemBuilder: (context, index) {
                return (messageList[index].messageType == 'in')
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.3,
                              left: 30.0,
                              top: 6.0,
                              bottom: 6.0),
                          decoration: BoxDecoration(
                            color: AppColors.inMsgBgColor,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
                            child: messageList[index].messageText.isNotEmpty
                                ? Text(
                                    messageList[index].messageText,
                                    style: AppTextStyle.msg,
                                    textAlign: TextAlign.left,
                                  )
                                : const Text('🤣'),
                          ),
                        ),
                      )
                    : (messageList[index].messageType == 'out')
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: 30.0,
                                  left: MediaQuery.of(context).size.width * 0.3,
                                  top: 6.0,
                                  bottom: 6.0),
                              decoration: BoxDecoration(
                                color: AppColors.outMsgBgColor,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0,
                                    right: 12.0,
                                    top: 8.0,
                                    bottom: 8.0),
                                child: messageList[index].messageText.isNotEmpty
                                    ? Text(
                                        messageList[index].messageText,
                                        style: AppTextStyle.msg,
                                        textAlign: TextAlign.right,
                                      )
                                    : const Text('👍'),
                              ),
                            ),
                          )
                        : const Text('Error');
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 14.0,
              right: 14.0,
              bottom: 50.0,
              top: 10.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: AppColors.inputMsgFieldBgColor,
              ),
              height: 46.0,
              padding: const EdgeInsets.only(
                left: 6.0,
                right: 6.0,
                top: 8.0,
                bottom: 8.0,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      width: 33.0,
                      height: 33.0,
                      color: AppColors.inputMsgFieldIconBgColor,
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        size: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: const TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 12.0),
                          hintText: "Message",
                          hintStyle: AppTextStyle.hintText,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.send_outlined,
                      size: 20.0,
                      color: AppColors.inputMsgFieldIconBgColor,
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
