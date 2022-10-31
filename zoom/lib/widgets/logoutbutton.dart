import 'package:flutter/material.dart';
import 'package:zoom/widgets/custom_button.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import '../resources/auth_methods.dart';
import '../screens/login/login_screen.dart';
class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
    required AuthMethods authMethods,
  }) : _authMethods = authMethods, super(key: key);

  final AuthMethods _authMethods;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        text: 'Đăng xuất',
        onPress: () async {
          await _authMethods.signOut();
          // Navigator.of(context).pushNamed('/login');
          Get.offAll(const LoginScreen());
        });
  }
}