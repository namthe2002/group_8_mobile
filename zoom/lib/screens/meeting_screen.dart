import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zoom/resources/jitsi_meet_methods.dart';
import 'package:zoom/screens/video_call_screen.dart';

import '../widgets/home_meeting_button.dart';
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
class MeetingScreen extends StatelessWidget {
   MeetingScreen({Key? key}) : super(key: key);


   final Color cam = HexColor.fromHex('DCD8D8FF');
   final Color xanh = HexColor.fromHex('#0a72ec');

   final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createNewMeeting () async {
    var random = Random();
    String roomName = (random.nextInt(1000000)+1000000).toString();
    _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinNewMeeting (BuildContext context) {
    //Navigator.of(context).pushNamed('/video-call-screen');
    Get.to(const VideoCallScreen());

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                HomeMeetingButton(
                  onPressed: createNewMeeting,
                  icon: Icons.video_call_rounded,
                  text: 'Cuộc họp mới',
                  color: cam,
                ),
                HomeMeetingButton(
                  onPressed: () {
                    //Navigator.of(context).pushNamed('/video-call-screen');
                    Get.to(const VideoCallScreen());
                  },
                  icon: Icons.add_box_rounded,
                  text: 'Tham gia',
                  color: xanh,
                ),
                HomeMeetingButton(
                  onPressed: () {},
                  icon: Icons.calendar_month_rounded,
                  text: 'Lên lịch',
                  color: xanh,
                ),
                HomeMeetingButton(
                  onPressed: () {},
                  icon: Icons.cast_sharp,
                  text: 'Chia sẻ Màn hình',
                  color: xanh,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Expanded(child: Image.asset('assets/images/zoom2.png')),
          ),
          const Text('Tìm người và bắt đầu cuộc trò chuyện!'),
        ],
      ),
    );
  }
}
