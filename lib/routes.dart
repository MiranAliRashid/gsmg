import 'package:flutter/material.dart';
import 'package:gsmg/chat_screen/chatscreen.dart';

class Routes extends StatelessWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/chatscreen',
      routes: {
        '/chatscreen': (context) => ChatScreen(),
      },
    );
  }
}
