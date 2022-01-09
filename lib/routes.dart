import 'package:flutter/material.dart';
import 'package:gsmg/chat_screen/chatscreen.dart';
import 'package:gsmg/register_screen/registerScreen.dart';
import 'package:gsmg/welcome_screen/welcomeScreen.dart';

class Routes extends StatelessWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/chatscreen',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/register': (context) => Register(),
        '/chatscreen': (context) => ChatScreen(),
      },
    );
  }
}
