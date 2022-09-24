import 'package:flutter/material.dart';

import '../resources/auth_methods.dart';
import '../widgets/custom_button.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthMethods _authMethods = AuthMethods();

    return Scaffold(
      body: Column(
        children: [
          Text('${_authMethods.user?.displayName}', style: TextStyle(fontSize: 30),),
          SizedBox(height: 10,),
          Text('${_authMethods.user?.email}'),
          SizedBox(height: 30,),

          Image.network('${_authMethods.user?.photoURL}'),
          CustomButton(text: 'Log out', onPress: () async {
             await _authMethods.signOut();
             Navigator.of(context).pushNamed('/login');
          })
        ],
      ),
    );
  }
}
