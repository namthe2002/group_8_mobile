import 'package:flutter/material.dart';
import 'package:zoom/screens/login_screen.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'zoom',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blue,
      ),
      routes: {
        '/login': (context) => LoginScreen(),
      },
      home: LoginScreen(),
    );
  }
}
