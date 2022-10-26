import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom/resources/auth_methods.dart';
import 'package:zoom/screens/home_screen.dart';
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
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Bắt đầu tham gia cuộc họp',
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 25),
            child: Container(
              child: Image.asset('assets/images/zoom1.png', fit: BoxFit.fill),
            ),
          ),
          CustomButton(
              text: 'Đăng nhập với Google',
              onPress: () async {
                bool temp = await _authMethods.signInWithGoogle(context);
                if (temp) {
                  //Navigator.pushNamed(context, '/home-screen');
                  Get.off(const HomeScreen());
                }
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {

                },
                child: const Text(
                  "Đăng ký",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {

                  },
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
