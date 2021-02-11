import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:we_do_flutter_app/util/authentication.dart';
import 'package:we_do_flutter_app/values/constants.dart';
import 'package:we_do_flutter_app/widgets/button_main.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

//DONE: Create Login Screen
class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.all(10.0),
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
            Builder(
              builder: (context) => ButtonMain(
                buttonText: 'Login',
                onPress: () async {
                  //TODO: error handling is not clean
                  try {
                    await Authentication().signInUser(email, password);
                    User currentUser = Authentication().userCredential.user;
                    if (currentUser != null) {
                      Navigator.pushNamed(context, HomeScreen.id,
                          arguments: {'currentUser': currentUser});
                    }
                  } catch (e) {
                    final snackBar = SnackBar(content: Text(e.toString()));
                    Scaffold.of(context).showSnackBar(snackBar);
                  }

                  // final newUser =
                  //     await Authentication().signInUser(email, password);
                  // if (newUser.runtimeType == String) {
                  //   print(newUser);
                  //   final snackBar = SnackBar(
                  //     content: Text(newUser),
                  //   );
                  //   Scaffold.of(context).showSnackBar(snackBar);
                  // } else if (newUser != null) {
                  //   User currentUser = newUser.user;
                  //   Navigator.pushNamed(context, HomeScreen.id,
                  //       arguments: {'currentUser': currentUser});
                  // }
                  //
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
