import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

import 'screens/chat_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.screenName,
      routes: <String, WidgetBuilder>{
        WelcomeScreen.screenName: (BuildContext context) => WelcomeScreen(),
        LoginScreen.screenName: (BuildContext context) => LoginScreen(),
        RegistrationScreen.screenName: (BuildContext context) => RegistrationScreen(),
        ChatScreen.screenName: (BuildContext context) => ChatScreen()
      },
    );
  }
}
