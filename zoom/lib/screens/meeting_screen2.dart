import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zoom/resources/jitsi_meet_methods.dart';
import 'package:zoom/screens/video_call_screen.dart';

import '../widgets/home_meeting_button.dart';

class MeetingScreen2 extends StatelessWidget {
  MeetingScreen2({Key? key}) : super(key: key);
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createNewMeeting () async {
    var random = Random();
    String roomName = (random.nextInt(1000000)+1000000).toString();
    _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
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
                  color: Colors.orange.shade700,
                ),
                HomeMeetingButton(
                  onPressed: () {
                    //Navigator.of(context).pushNamed('/video-call-screen');
                    Get.to(const VideoCallScreen());
                  },
                  icon: Icons.add_box_rounded,
                  text: 'Tham gia',
                  color: Colors.blue.shade500,
                ),
                HomeMeetingButton(
                  onPressed: () {
                    print(MediaQuery.of(context).size.width);
                  },
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
            child: Expanded(child: Image.asset('assets/images/zoom2.png')),
          ),
          const Text('Tìm người và bắt đầu cuộc trò chuyện!'),
        ],
      ),
    );
  }
}
