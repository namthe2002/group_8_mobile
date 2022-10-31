import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MeetingOption extends StatelessWidget {
  final String text;
  bool isMute;
  final Function(bool) onChange;
  MeetingOption({
    Key? key,
    required this.text,
    required this.isMute,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          CupertinoSwitch(value: isMute, onChanged: onChange)
          // Switch.adaptive(
          //   value: isMute,
          //   onChanged: onChange,
          // ),
        ],
      ),
    );
  }
}
