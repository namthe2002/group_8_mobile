import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// https://firebase.flutter.dev/docs/firestore/usage/

class FirestoreMethods {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
