import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'auth_methods.dart';

/// https://firebase.flutter.dev/docs/firestore/usage/

class FirestoreMethods {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final AuthMethods _authMethods = AuthMethods();
  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingHistory =>
      _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser?.uid)
          .collection('meeting')
          .snapshots();

  Future<void> addToMeetHistory(String meetingName) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser?.uid)
          .collection('meeting')
          .add({
        'meetingName': meetingName,
        'creatAt': DateTime.now().toIso8601String(),
        'hostName' : _authMethods.user?.displayName
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
