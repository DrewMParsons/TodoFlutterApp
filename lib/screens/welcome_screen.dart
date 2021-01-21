import 'package:flutter/material.dart';
import 'package:we_do_flutter_app/screens/login_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:we_do_flutter_app/screens/registration_screen.dart';
import 'package:we_do_flutter_app/values/theme.dart';
import 'package:we_do_flutter_app/widgets/button_main.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

//TODO: add functionality to skip welcome screen if logged in
class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.0,
              width: 300.0,
              child: ScaleAnimatedTextKit(
                onTap: () {
                  print("Tap Event");
                },
                text: ["WeDo", "Chores", "Together"],
                textStyle: TextStyle(
                  fontSize: 40.0,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset('images/checkLogo.png'),
                height: 300.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            ButtonMain(
              buttonText: 'Login',
              onPress: () {
                print('login pushed');
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ButtonMain(
                buttonText: 'Register',
                onPress: () {
                  print('register pressed');
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
