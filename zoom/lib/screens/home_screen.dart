import 'package:flutter/material.dart';
import 'package:zoom/resources/auth_methods.dart';
import 'package:zoom/screens/history_meeting.dart';
import 'package:zoom/screens/setting_screen.dart';
import 'package:zoom/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/home_meeting_button.dart';
import 'meeting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void backToLogin(BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    HistoryMeetingScreen(),
    const Text('Liên lạc'),
    SettingScreen(),
    // CustomButton(text: 'Log out', onPress: () async {
    //    await FirebaseAuth.instance.signOut();
    // })

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: const Text('Gặp gỡ & trò chuyện'),
        
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}


