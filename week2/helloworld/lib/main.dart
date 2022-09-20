import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo hello world + tên sinh viên'),
        ),
        body: Center(
          child: Text('Hello world Tạ Thành Bảo'),
        ),
      ),
    );
  }
}
