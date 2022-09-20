import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:o_an_quan/models/board.dart';
import 'package:o_an_quan/widgets/background_widgets.dart';
import 'package:provider/provider.dart';

import 'models/player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Board(),
        ),
        ChangeNotifierProvider(create: (context) => Player1()),
        ChangeNotifierProvider(create: (context) => Player2())
      ],
      child: MaterialApp(
        home: Background(),
      ),
    );
  }
}
