import 'package:flutter/material.dart';

import '../resources/auth_methods.dart';
import '../widgets/logoutbutton.dart';

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
    final AuthMethods authMethods = AuthMethods();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 18, right: 8.0, left: 8.0),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                  visualDensity: const VisualDensity(vertical: 3), // to expand
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      '${authMethods.user?.photoURL}',
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Text('${authMethods.user?.displayName}'),
                  subtitle: Row(
                    children: [
                      Image.asset(
                        'assets/icons/ggicon.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('${authMethods.user?.email}'),
                    ],
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            Text('Các tính năng thêm'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.start,
                softWrap: true),
            const Divider(),
            const ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text('Chung'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.grey,
              ),
            ),

            const ListTile(
              leading: Icon(
                Icons.qr_code,
                color: Colors.black,
              ),
              title: Text('Quét mã QR'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.grey,
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.info_outline,
                color: Colors.black,
              ),
              title: Text('Thông tin'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.grey,
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
                  LogoutButton(authMethods: authMethods),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
