import 'dart:math';

import 'package:flutter_base/chat/model.dart';

final messageType = <String>['sender', 'receiver'];

var messageList = List.generate(
    1000,
    (index) => Message(
        messageText: index.toString(),
        messageType: messageType[Random().nextInt(messageType.length)]));
