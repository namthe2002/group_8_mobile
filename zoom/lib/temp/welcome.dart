// import 'package:flutter/material.dart';
//
// import '../components/background_login.dart';
// import '../components/responsive.dart';
//
// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Background(
//       child: SingleChildScrollView(
//         child: SafeArea(
//           child: Responsive(
//             desktop: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//
//                 Expanded(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       SizedBox(
//                         width: 450,
//                         child: Placeholder()
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             mobile: const MobileWelcomeScreen(),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class MobileWelcomeScreen extends StatelessWidget {
//   const MobileWelcomeScreen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//
//         Row(
//           children: const [
//             Spacer(),
//             Expanded(
//               flex: 8,
//               child: Placeholder(),
//             ),
//             Spacer(),
//           ],
//         ),
//       ],
//     );
//   }
// }