import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickFromCamera extends StatelessWidget {
   File image;
   PickFromCamera({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
          final imageSource = await ImagePicker().pickImage(source: ImageSource.camera);
          if(imageSource == null) return;
          final imageTemp = File(imageSource.path);
          image = imageTemp;
      },
      icon: const Icon(Icons.image),
      label: const Text('Camera'),
    );
  }
}
