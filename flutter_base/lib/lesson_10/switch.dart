import 'dart:developer';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SwitchDemo(),
  ));
}

class SwitchDemo extends StatefulWidget {
  SwitchDemo({Key? key}) : super(key: key);

  @override
  State<SwitchDemo> createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool isChecked = false;
  bool? isCheckboxChecked = false;
  DevGrades? isRadioChecked = DevGrades.junior;

  _toggleSwitch(bool value) {
    setState(() {
      isChecked = value;
    });
  }

  _radioToggle(DevGrades? value) {
    setState(() {
      isRadioChecked = value;
    });
  }

  _toggleCheckbox(bool? value) {
    setState(() {
      isCheckboxChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch demo"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Toggle'),
            trailing: Switch(
              // activeColor: Colors.red,
              // activeThumbImage: const NetworkImage('https://www.ugolnik.info/wp-content/uploads/2006/07/Vimlogo.png'),
              // inactiveThumbImage: const NetworkImage('https://logowik.com/content/uploads/images/t_visual-studio-code4470.jpg'),
              value: isChecked,
              onChanged: _toggleSwitch, 
            ),
          ),
          // ListTile(
          //   title: const Text('Toggle adaptive'),
          //   trailing: Switch.adaptive(
          //     value: isChecked,
          //     onChanged: _toggleSwitch, 
          //   ),
          // ),
          // SwitchListTile(
          //   title: const Text('Toggle List'),
          //   value: isChecked,
          //   onChanged: _toggleSwitch
          // ),
          // ListTile(
          //   title: const Text('Radio junior'),
          //   leading: Radio<DevGrades>(
          //     value: DevGrades.junior,
          //     groupValue: isRadioChecked,
          //     onChanged: _radioToggle,
          //   ),
          // ),
          // RadioListTile<DevGrades>(
          //   title: const Text('Radio middle'),
          //   value: DevGrades.middle,
          //   groupValue: isRadioChecked,
          //   onChanged: _radioToggle,
          // ),
          // ListTile(
          //   title: const Text('Checkbox'),
          //   trailing: Checkbox(
          //     value: isCheckboxChecked,
          //     onChanged: _toggleCheckbox,
          //   ),
          // ),
          // CheckboxListTile(
          //   title: const Text("Checkbox"),
          //   tristate: true,
          //   value: null,
          //   onChanged: (bool? value) {},
          // )
        ],
      ),
    );
  }
}

enum DevGrades {
  senior,
  middle,
  junior,
}