import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

import '../resources/auth_methods.dart';
import '../resources/jitsi_meet_methods.dart';
import '../widgets/meeting_options.dart';

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

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final Color color = HexColor.fromHex('DCD8D8FF');
  final Color color2 = HexColor.fromHex('#f9f8f8');
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(
      text: _authMethods.user?.displayName,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
  }

  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //Navigator.of(context).pushReplacementNamed('/home-screen');
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: CupertinoColors.darkBackgroundGray,
        ),
        shape: Border.all(width: 0.5, color: Colors.grey.shade300),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Tham gia cuộc họp',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Column(
                  children: [
                    // ignore: sized_box_for_whitespace
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 0.5, color: Colors.grey.shade300)),
                        height: 53,
                        child: TextField(
                          controller: meetingIdController,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            hintText: 'Id cuộc họp',
                            hintTextDirection: TextDirection.ltr,
                          ),
                        )),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 0.5, color: Colors.grey.shade300)),
                      child: TextField(
                        controller: nameController,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: 'Tên của bạn',
                          hintTextDirection: TextDirection.ltr,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: meetingIdController.text.trim().isEmpty
                          ? null
                          : _joinMeeting,
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.blue.shade600,
                          fixedSize: const Size(240, 47)),
                      child: const Text(
                        'Tham gia',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 18.0),
                      child: Text('TÙY CHỌN THAM GIA'),
                    ),
                    SizedBox(
                      height: 50,
                      // decoration:
                      //     BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: MeetingOption(
                        text: 'Không kết nối âm thanh',
                        isMute: isAudioMuted,
                        onChange: toggleAudioMuted,
                      ),
                    ),
                    const SizedBox(
                      height: 1.5,
                    ),
                    SizedBox(
                      // decoration:
                      //     BoxDecoration(border: Border.all(color: Colors.grey)),
                      height: 50,
                      child: MeetingOption(
                        text: 'Tắt Video của tôi',
                        isMute: isVideoMuted,
                        onChange: toggleVideoMuted,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toggleAudioMuted(bool temp) {
    setState(() {
      isAudioMuted = temp;
    });
  }

  void toggleVideoMuted(bool temp) {
    setState(() {
      isVideoMuted = temp;
    });
  }
}
