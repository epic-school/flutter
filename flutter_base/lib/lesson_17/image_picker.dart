import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:form_builder_image_picker/form_builder_image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class ApiImage {
  final String imageUrl;
  final String id;
  ApiImage({
    required this.imageUrl,
    required this.id,
  });
}

class MyHomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormBuilderImagePicker Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FormBuilderImagePicker(
                  name: 'photos',
                  displayCustomType: (obj) => obj is ApiImage ? obj.imageUrl : obj,
                  decoration: const InputDecoration(labelText: 'Pick Photos'),
                  maxImages: 5,
                  initialValue: const [
                    // 'https://images.pexels.com/photos/7078045/pexels-photo-7078045.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                    // const Text('this is an image\nas a widget !'),
                    // ApiImage(
                    //   id: 'whatever',
                    //   imageUrl: 'https://images.pexels.com/photos/8311418/pexels-photo-8311418.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
                    // ),
                  ],
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () async {
                    if (_formKey.currentState?.saveAndValidate() == true) {
                      final data = FormData.fromMap(_formKey.currentState!.value);
                      debugPrint(_formKey.currentState!.value.toString());

                      final List<dynamic> photos = _formKey.currentState!.value['photos'];
                      for (var file in photos) {
                        final p = await MultipartFile.fromFile(file.path);
                        data.files.add(MapEntry('file_name', p));
                      }
                      log(photos.toString());
                    }
                  },
                ),
                ElevatedButton(
                  child: const Text('Reset'),
                  onPressed: () {
                    _formKey.currentState?.reset();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}