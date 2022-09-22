import 'package:flutter/material.dart';
import 'package:zoom/screens/history_meeting.dart';

import '../widgets/home_meeting_button.dart';
import 'meeting_screen.dart';

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

  List<Widget> pages = [
      MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text('Liên lạc'),
    const Text('Setting'),

  ];

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
      body: pages[_page],
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


