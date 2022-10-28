import 'package:flutter/material.dart';
import 'package:zoom/screens/history_meeting.dart';
import 'package:zoom/screens/setting_screen.dart';

import 'meeting_screen2.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color color = HexColor.fromHex('#38394d');

  int _page = 0;

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen2(),
    const HistoryMeetingScreen(),
    Text('abc'),
    const SettingScreen(),
    // CustomButton(text: 'Log out', onPress: () async {
    //    await FirebaseAuth.instance.signOut();
    // })
  ];

  Map<int, String> titlePage = {
    0: 'Gặp gỡ & trò chuyện',
    1: 'Cuộc họp',
    2: 'Liên lạc',
    3: 'Thêm',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: Text(titlePage[_page]!),
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
