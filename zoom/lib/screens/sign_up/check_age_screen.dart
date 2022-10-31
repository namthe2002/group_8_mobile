import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zoom/screens/sign_up/signup_screen.dart';

class CheckAge extends StatefulWidget {
  const CheckAge({Key? key}) : super(key: key);

  @override
  State<CheckAge> createState() => _CheckAgeState();
}

class _CheckAgeState extends State<CheckAge> {
  DateTime? date;
  var check = false;

  bool isAdult2(String birthDateString) {
    String datePattern = "dd-MM-yyyy";

    // Current time - at this moment
    DateTime today = DateTime.now();

    // Parsed date to check
    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);

    // Date to check but moved 18 years ahead
    DateTime adultDate = DateTime(
      birthDate.year + 18,
      birthDate.month,
      birthDate.day,
    );

    return adultDate.isBefore(today);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Get.to(SignUpScreen());
              },
              child: Text(
                'Tiếp',
                style: TextStyle(color: check ? Colors.blue : Colors.grey),
              ))
        ],
        leading: TextButton(
          child: const Text('Hủy'),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Để xác minh, vui lòng xác nhận ngày sinh của bạn',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(width: 0.5, color: Colors.grey.shade300)),
                child: TextButton(
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1600),
                              lastDate: DateTime(2030))
                          .then((value) {
                        setState(() {
                          date = value;
                        });
                        if (date!.isAfter(DateTime.now()
                            .subtract(const Duration(days: 6570)))) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                'Đăng ký thất bại',
                                textAlign: TextAlign.center,
                              ),
                              content: const Text(
                                'Bạn không đủ điều kiện đăng ký vào Zoom vào thời điểm này',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              ),
                              actions: [
                                const Divider(),
                                Center(
                                  child: TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text(
                                        'OK',
                                        style: TextStyle(color: Colors.blue),
                                      )),
                                ),
                              ],
                            ),
                          );
                        } else {
                          check = true;
                        }
                      });
                    },
                    child: Text(
                      date == null ? 'Tháng/Ngày/Năm' : '${date?.toString()}',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ))),
            const SizedBox(
              height: 20,
            ),
            if (check)
              const Text('Xác minh thành công',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
            const Text('Dữ liệu này sẽ không được lưu trữ',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
