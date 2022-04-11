import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/constants/colors.dart';

class ReminderButton extends StatefulWidget {
  const ReminderButton({Key? key}) : super(key: key);

  @override
  State<ReminderButton> createState() => _ReminderButtonState();
}

class _ReminderButtonState extends State<ReminderButton> {
  var _isPressed = false;
  final double _iconSize = 26.0;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0.0),
      // alignment: Alignment.topRight,
      onPressed: () {
        setState(() {
          _isPressed ? _isPressed = false : _isPressed = true;
        });
      },
      icon: _isPressed
          ? const Icon(Icons.notifications)
          : const Icon(Icons.notifications_none),
      color: _isPressed ? AppColors.orange : AppColors.grey,
      iconSize: _iconSize,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      constraints: BoxConstraints(maxHeight: _iconSize, maxWidth: _iconSize),
    );
  }
}
