import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    String textiD ='';
    // return Scaffold(
    //   backgroundColor: Colors.grey.shade200,
    //   //Colors.white,
    //   appBar: AppBar(
    //     backgroundColor: Colors.white,
    //     title: Text('Tham gia cuộc họp', style: TextStyle(color: Colors.black)),
    //     centerTitle: true,
    //     elevation: 0,
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.only(top: 18.0),
    //     child: Column(
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.only(top: 10, bottom: 20),
    //           child: Container(
    //             decoration: const BoxDecoration(
    //               color: Colors.white,
    //             ),
    //             child: Row(
    //               children: [
    //                 // const TextField(
    //                 //   textAlign: TextAlign.center,
    //                 //   decoration:
    //                 //       InputDecoration.collapsed(hintText: 'ID Cuộc họp'),
    //                 // ),
    //                 Expanded(
    //                     child: Text(
    //                   'ID cuộc họp',
    //                   style: TextStyle(fontSize: 18),
    //                   textAlign: TextAlign.center,
    //                 )),
    //                 IconButton(
    //                     icon: Icon(
    //                       Icons.expand_circle_down_outlined,
    //                       color: Colors.blue.shade600,
    //                     ),
    //                     onPressed: () {}),
    //               ],
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(bottom: 20),
    //           child: Text(
    //             'Tham gia với liên kết cá nhân',
    //             style: TextStyle(color: Colors.blue.shade900),
    //           ),
    //         ),
    //         Container(
    //           height: 40,
    //           decoration: const BoxDecoration(
    //             color: Colors.white,
    //           ),
    //           child: Row(
    //             children: [
    //               Expanded(
    //                   child: Text(
    //                 'ID cuộc họp',
    //                 style: TextStyle(fontSize: 18),
    //                 textAlign: TextAlign.center,
    //               )),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(

      backgroundColor: color2,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/home-screen');
          },
          icon: Icon(Icons.arrow_back_ios_new),
          color: CupertinoColors.darkBackgroundGray,
        ),
        shape: const Border(
            bottom: BorderSide(
          width: 1,
          color: Colors.grey,
        )),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Tham gia cuộc họp',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                        // decoration: BoxDecoration(
                        //     border: Border.all(color: Colors.grey, width: 0.3)),
                        height: 53,
                        child:
                            // TextField(
                            //   controller: meetingIdController,
                            //   onChanged: (temp) {
                            //     setState(() {
                            //       meetingIdController.text = temp;
                            //     });
                            //   },
                            //   maxLines: 1,
                            //   textDirection: TextDirection.ltr ,
                            //   textAlign: TextAlign.center,
                            //   keyboardType: TextInputType.number,
                            //   decoration: InputDecoration(
                            //     filled: true,
                            //     fillColor: Colors.white,
                            //     border: InputBorder.none,
                            //     hintText: 'ID Cuộc họp',
                            //   ),
                            // ),
                            TextField(
                          onChanged: (val) {
                            setState(() {
                              textiD = val;
                            });

                          },
                          controller: meetingIdController,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            hintText: 'Id cuộc họp',
                            hintTextDirection: TextDirection.ltr,
                          ),
                        )),
                    Container(
                        // decoration: BoxDecoration(
                        //     border: Border.all(color: Colors.grey, width: 0.3)),
                        height: 53,
                        child: TextField(
                          controller: nameController,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            hintText: 'Tên của bạn',
                            hintTextDirection: TextDirection.ltr,
                          ),
                        )
                        // TextField(
                        //   controller: nameController,
                        //   maxLines: 1,
                        //   textAlign: TextAlign.center,
                        //   keyboardType: TextInputType.text,
                        //   decoration: InputDecoration(
                        //     filled: true,
                        //     fillColor: Colors.white,
                        //     border: InputBorder.none,
                        //     hintText: 'Tên của bạn',
                        //     hintTextDirection: TextDirection.ltr,
                        //     //  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                        //   ),
                        // ),
                        ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: meetingIdController.text.trim().isEmpty
                          ? null
                          : _joinMeeting,
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fixedSize: const Size(240, 47),
                          primary: Colors.blue.shade600),
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
                    Container(
                      height: 56,
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
                    Container(
                      // decoration:
                      //     BoxDecoration(border: Border.all(color: Colors.grey)),
                      height: 56,
                      child: MeetingOption(
                        text: 'Tắt Video của tôi',
                        isMute: isVideoMuted,
                        onChange: toggleVideoMuted,
                      ),
                    ),
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
