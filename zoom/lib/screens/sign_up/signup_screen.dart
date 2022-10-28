import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/image_picker/picker_image.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();

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
          SizedBox(height: 10,),
          UserImagePicker(),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey.shade300),
            ),
            child: TextField(
              controller: name,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
                filled: true,
                hintText: 'Nhập tên của bạn',
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey.shade300),
            ),
            child: TextField(
              controller: email,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
                filled: true,
                hintText: 'Nhập Gmail',
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
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
                filled: true,
                hintText: 'Nhập mật khẩu',
              ),
            ),
          ),
          TextField(
            controller: password,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              border: UnderlineInputBorder(borderSide: BorderSide.none),
              filled: true,
              hintText: 'Nhập lại mật khẩu',
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
                child: const Text('Đăng ký')),
          ),

        ],
      ),
    );
  }
}
