import 'package:flutter/material.dart';
import 'package:we_do_flutter_app/screens/home_screen.dart';
import 'package:we_do_flutter_app/values/constants.dart';
import 'package:we_do_flutter_app/widgets/button_main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

//DONE: Create Register Screen
class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/checkLogo.png'),
                    height: 60.0,
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'WeDo',
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).accentColor),
                ),
              ],
            ),
            SizedBox(
              height: 200.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                email = value;
              },
              decoration:
                  textFileDecoration.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                password = value;
              },
              decoration:
                  textFileDecoration.copyWith(hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 20.0,
            ),
            ButtonMain(
              buttonText: 'Register',
              onPress: () {
                Navigator.pushNamed(context, HomeScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
