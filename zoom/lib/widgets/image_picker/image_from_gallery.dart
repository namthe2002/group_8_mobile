import 'package:flutter/material.dart';

class PickFromGallery extends StatelessWidget {
  const PickFromGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.image),
      label: const Text('Gallery'),
    );
  }
}
