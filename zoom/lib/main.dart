// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:zoom/resources/auth_methods.dart';
import 'package:zoom/screens/home_screen.dart';
import 'package:zoom/screens/login/login_screen.dart';
import 'package:zoom/screens/sign_up/check_age_screen.dart';
import 'package:zoom/screens/video_call_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const myApp());
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'zoom',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/home-screen': (context) => const HomeScreen(),
          '/video-call-screen': (context) => const VideoCallScreen(),
        },
        initialRoute: '/',
        getPages: [
          GetPage(
              name: '/',
              page: () => AuthMethods().user != null
                  ? const HomeScreen()
                  : const LoginScreen()),
          GetPage(name: '/login', page: () => const LoginScreen()),
          GetPage(
              name: '/video-call-screen', page: () => const VideoCallScreen()),
        ],
        home:
        StreamBuilder(
            stream: AuthMethods().authChanges,
            builder: (context, snapshot) {

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData && AuthMethods().user != null) {
                const HomeScreen();
              }
              return const LoginScreen();
            }),
        );
  }
}
