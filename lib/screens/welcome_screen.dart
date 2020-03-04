import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/round_btn.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String screenName = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
  
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.forward(); // addStatusListener = completed
//    controller.reverse(from: 1.0); // addStatusListener = dismissed

//    animation.addStatusListener((status) {
//      if(status == AnimationStatus.completed) {
//        controller.reverse(from: 1.0);
//      } else if (status == AnimationStatus.dismissed) {
//        controller.forward();
//      }
//    });

    controller.addListener(() {
      setState(() {});
//      print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButton(
              onPress: () {
                //Go to login screen.
                Navigator.pushNamed(context, LoginScreen.screenName);
              },
              title: 'Login',
              colour: Colors.lightBlue,
            ),
            RoundButton(
              onPress: () {
                //Go to registration screen.
                Navigator.pushNamed(context, RegistrationScreen.screenName);
              },
              colour: Colors.blueAccent,
              title: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}