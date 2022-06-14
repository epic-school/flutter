import 'dart:convert';
import 'dart:io';

void main() async {
  var file = File('example.txt');

  var raf = await file.open(mode: FileMode.write);

  await raf.setPosition(6);
  await raf.writeString("Hello!");
}