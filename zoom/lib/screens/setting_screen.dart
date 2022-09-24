import 'package:flutter/material.dart';

import '../resources/auth_methods.dart';
import '../widgets/custom_button.dart';

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

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = HexColor.fromHex('#f9f8f8');

    final AuthMethods _authMethods = AuthMethods();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    '${_authMethods.user?.photoURL}',
                  ),
                ),
                title: Text('${_authMethods.user?.displayName}'),
                subtitle: Text('${_authMethods.user?.email}'),
              ),
            ),
            // Text(
            //   '${_authMethods.user?.displayName}',
            //   style: TextStyle(fontSize: 30),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text('${_authMethods.user?.email}'),
            // SizedBox(
            //   height: 30,
            // ),
            // Image.network('${_authMethods.user?.photoURL}'),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                      text: 'Log out',
                      onPress: () async {
                        await _authMethods.signOut();
                        Navigator.of(context).pushNamed('/login');
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
