import 'package:flutter/material.dart';
import 'package:flutter_base/chat/data.dart';
import 'package:flutter_base/chat/model.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();
  final _focus = FocusNode();

  final _noAutoScrollToBottomAfterPixels = 10000;

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  void initState() {
    // Начальная установка скролла в самый низ
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _scrollToBottom();
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chat'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Flexible(
              child: Ink(
                decoration: BoxDecoration(
                    color: Colors.yellow[100],
                    border: Border.all(color: Colors.red, width: 5.0)),

                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: messageList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return (messageList[index].messageType == 'sender')
                          ? Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.all(8.0),
                              margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.4,
                                  right: 8.0,
                                  top: 2.0,
                                  bottom: 2.0),
                              decoration: BoxDecoration(
                                color: Colors.green[300],
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Text(
                                messageList[index].messageText,
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            )
                          : (messageList[index].messageType == 'receiver')
                              ? Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.all(8.0),
                                  margin: EdgeInsets.only(
                                    left: 8.0,
                                      right: MediaQuery.of(context).size.width *
                                          0.3,
                                      top: 2.0,
                                      bottom: 2.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Text(
                                    messageList[index].messageText,
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                )
                              : const Text('Error');
                    }),
              ),
            ),
            TextField(
              textAlignVertical: TextAlignVertical.center,
              showCursor: true,
              controller: _messageController,
              focusNode: _focus,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.fromLTRB(16.0, 4.0, 8.0, 4.0),
                suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      setState(() {
                        messageList.add(Message(
                            messageText: _messageController.text,
                            messageType: 'sender'));
                        _messageController.clear();
                      });

                      // Пока скролл не перейдет границу в заданное количество пикселей
                      // при добавлении нового сообщения будем скролить вниз
                      if (!(_scrollController.position.pixels <
                          _scrollController.position.maxScrollExtent -
                              _noAutoScrollToBottomAfterPixels)) {
                        _scrollToBottom();
                      }
                    }),
                hintText: 'Message',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
