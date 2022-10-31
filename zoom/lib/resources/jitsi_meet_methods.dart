import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:jitsi_meet/feature_flag/feature_flag.dart';
// import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom/resources/auth_methods.dart';

import 'auth_methods.dart';
import 'firestore_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();

  void createMeeting(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted,
      String username = ''}) async {
    try {
      String? name = _authMethods.user?.displayName;
      if (username.isEmpty) {
        name = _authMethods.user?.displayName;
      } else {
        name = username;
      }

      var options = JitsiMeetingOptions(
        roomNameOrUrl: roomName,
        // isAudioMuted: isAudioMuted,
        // isVideoMuted: isVideoMuted,
        // userAvatarUrl: _authMethods.user.photoURL,
        userDisplayName: name,
        // userEmail: _authMethods.user.email
      );

      await _firestoreMethods.addToMeetHistory(roomName);
      await JitsiMeetWrapper.joinMeeting(
          options: options, listener: JitsiMeetingListener());
      FeatureFlag.isWelcomePageEnabled;
      FeatureFlag.resolution;
      FeatureFlag.isAddPeopleEnabled;
      // FeatureFlag.
      // featureFlag.resolution = FeatureFlagVideoResolution
      //     .MD_RESOLUTION; // Limit video resolution to 360p

      // var options = JitsiMeetingOptions(room: roomName)
      //   // ..room = roomName
      //   ..userDisplayName = _authMethods.user.displayName
      //   ..userEmail = _authMethods.user.email
      //   ..userAvatarURL = _authMethods.user.photoURL // or .png
      //
      //   ..audioMuted = isAudioMuted
      //   ..videoMuted = isVideoMuted;
      //
      // await JitsiMeet.joinMeeting(options);
    } catch (error) {
      debugPrint("error: $error");
    }
  }
}
