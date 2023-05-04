import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import 'imagede.dart';

class YourScreen extends StatefulWidget {
  @override
  _YourScreenState createState() => _YourScreenState();
}

class _YourScreenState extends State<YourScreen> {
  XFile? pickedFile;
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Center(
        child: pickedImage != null
            ? Image.file(
                pickedImage!,
                fit: BoxFit.cover,
              )
            : Text('No image selected.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          File? temp = await Services.pickImage(context);
          setState(() {
            pickedImage = temp;
          });
          if (pickedImage != null) {
            print(pickedImage!.path);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
