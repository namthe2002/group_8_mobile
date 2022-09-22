import 'package:flutter/material.dart';
import 'package:zoom/widgets/CustomButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Start or join a meeting',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.asset('assets/images/pngegg.png'),
          ),
          CustomButton(text: 'Google Sign In', onPress: () {}),
        ],
      ),
    );
  }
}
