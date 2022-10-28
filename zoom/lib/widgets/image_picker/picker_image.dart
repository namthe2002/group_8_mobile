import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;

  void _pickImageFromCamera() async {
    try {
      final pickedImageFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedImageFile == null) return;
      final imageTemp = File(pickedImageFile.path);
      setState(() {
        _pickedImage = imageTemp;
      });
    } catch (e) {
      print(e);
    }
  }
  void _pickImageFromGallery() async {
    try {
      final pickedImageFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImageFile == null) return;
      final imageTemp = File(pickedImageFile.path);
      setState(() {
        _pickedImage = imageTemp;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage!) : null,
        ),
        TextButton.icon(
          onPressed: _pickImageFromCamera,
          icon: Icon(Icons.camera_alt),
          label: Text(
            'Chụp ảnh',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),TextButton.icon(
          onPressed: _pickImageFromGallery,
          icon: Icon(Icons.image),
          label: Text(
            'Chọn ảnh',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}
