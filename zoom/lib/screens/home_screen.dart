import 'package:flutter/material.dart';

import '../widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: const Text('Gặp gỡ & trò chuyện'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.emergency_recording))
        ],
      ),
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeMeetingButton(
                  onPressed: () {},
                  icon: Icons.video_call_rounded,
                  text: 'Cuộc họp mới',
                  color: Colors.orange.shade700,
                ),
                HomeMeetingButton(
                  onPressed: () {},
                  icon: Icons.add_box_rounded,
                  text: 'Tham gia',
                  color: Colors.blue.shade500,
                ),
                HomeMeetingButton(
                  onPressed: () {},
                  icon: Icons.calendar_month_rounded,
                  text: 'Lên lịch',
                  color: Colors.blue.shade500,
                ),
                HomeMeetingButton(
                  onPressed: () {},
                  icon: Icons.cast_sharp,
                  text: 'Chia sẻ Màn hình',
                  color: Colors.blue.shade500,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Image.asset('assets/images/zoom2.png'),
          ),
          const Expanded(child: Text('Tìm người và bắt đầu cuộc trò chuyện!')),

        ],
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue.shade500,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey.shade600,
          onTap: onPageChanged,
          currentIndex: _page,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.mode_comment_rounded,
              ),
              label: 'Gặp gỡ và trò chuyện',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time_filled_outlined),
                backgroundColor: Colors.white,
                label: 'Cuộc họp'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                backgroundColor: Colors.white,
                label: 'Liên lạc'),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz),
                backgroundColor: Colors.white,
                label: 'Thêm'),
          ],
        ),
      ),
    );
  }
}
