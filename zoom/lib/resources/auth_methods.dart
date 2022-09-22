import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom/utils/utils.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;
  Future<bool> signInWithGoogle(BuildContext context) async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,

      );
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      // có 1 user và sign in hoạt động mà k conflict ,
      if(user!=null ) {
        //  xác thực thành công

        //người dùng đã tồn tại
        if(userCredential.additionalUserInfo!.isNewUser) {
          // check xem người dùng vừa được đăng ký

          await _firestore.collection('user').doc(user.uid).set({
            'username' : user.displayName,
            'uid' : user.uid,
            'profilePhoto' : user.photoURL,
          });
          //logging in
        }
        res = true;
      }

    } on FirebaseAuthException catch (e) {
      // FirebaseAuthException dùng để bắt lỗi liên quan đến firebase xác thực
      showSnackBar(context, e.message!);
      res = false;
    }
    return res;
  }
}