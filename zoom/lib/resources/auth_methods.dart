// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_sign_in/google_sign_in.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
class AuthMethods {
  /// https://github.com/jitsi/jitsi-meet/blob/a618697e34d947f0cc0d9ee4a0fc79c76fbae5e6/react/features/base/flags/constants.js
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => _auth.authStateChanges();

  User? get user => _auth.currentUser;

  Future<bool> signInWithGoogle(BuildContext context) async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      // có 1 user và sign in hoạt động mà k conflict ,
      if (user != null) {
        //  xác thực thành công
        //người dùng đã tồn tại
        if (userCredential.additionalUserInfo!.isNewUser) {
          // check xem người dùng vừa được đăng ký
          // Create a CollectionReference called users that references the firestore collection
          //Đặt dữ liệu của 1 user trên firebase, ghi đè lên mọi user hiện có. Nếu chưa tồn tại, nó sẽ được tạo.
          print('------------------------------------------------------------${user.uid}');
          print('------------------------------------------------------------${user.toString()}');
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
          print('------------------------------------------------------------${user.uid}');
          print('------------------------------------------------------------${user.toString()}');
          //logging in
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      // FirebaseAuthException dùng để bắt lỗi liên quan đến firebase xác thực
      // showSnackBar(context, e.message!);
      Get.snackbar('Error AUTH: ', 'Lỗi xác thực : $e');
      res = false;
    }
    return res;
  }


  Future<void> signOut() async {
    try {
      final googleSignIn = GoogleSignIn();
      await googleSignIn.disconnect();
      await _auth.signOut();

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}