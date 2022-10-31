import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.blue,
          ),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        title: const Text(
          'Zoom',
          style: TextStyle(color: Colors.blue, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey.shade300),
            ),
            child: TextField(
              controller: email,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
                filled: true,
                hintText: 'Địa chỉ email',
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey.shade300),
            ),
            child: TextField(
              controller: password,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
                filled: true,
                hintText: 'Mật khẩu',
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 350,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Đăng nhập')),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Quên mật khẩu',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              )),
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.red,
                        ),
                        title: Text('Đăng nhập bằng gmail'),
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const ListTile(
                        leading: Icon(
                          Icons.facebook,
                          color: Colors.blue,
                        ),
                        title: Text('Đăng nhập bằng Facebook'),
                      )),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
