import 'package:flutter/material.dart';
import 'package:zoom/resources/auth_methods.dart';
import 'package:zoom/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Start or join a meeting',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 25),
            child: Container(

                child: Image.asset('assets/images/zoom1.png', fit: BoxFit.fill),),
          ),
          CustomButton(text: 'Google Sign In',  onPress: () async {
              bool temp = await _authMethods.signInWithGoogle(context);
              if(temp) {
                  Navigator.pushNamed(context, '/home-screen');
              }

          }),
        ],
      ),
    );
  }
}
