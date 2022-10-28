import 'package:flutter/material.dart';

class SignInManual extends StatelessWidget {
  const SignInManual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Zoom',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        children: [
          const TextField(
            maxLines: 1,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Địa chỉ email',
            ),
          ),
          const TextField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            maxLines: 1,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Mật khẩu',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              child: const Text(
                'Đăng nhập',
                style: TextStyle(color: Colors.white),
              )),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {

              },
              child: Text(
                'Quên mật khẩu',
                style: TextStyle(
                    color: Colors.blue.shade500,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ))
        ],
      ),
    );
  }
}
