import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../button_widget/round_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1), vsync: this, //ticker
    );
    //background color change
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
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
                  tag: 'logo_icon',
                  child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 70 // Adjust this value
                      ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Connectly',
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                      speed: Duration(milliseconds: 200),
                    ),
                  ],
                  totalRepeatCount: 1,
                  // pause: Duration(milliseconds: 1000),
                )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButton(
              btnName: 'Log In',
                btncolor: Colors.lightBlueAccent,
                btnOnpressedFunction:() {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
            ),
RoundButton(
  btnName: 'Register',
  btncolor: Colors.blueAccent,
  btnOnpressedFunction: (){
    Navigator.pushNamed(context, RegistrationScreen.id);
  },
)          ],
        ),
      ),
    );
  }
}
