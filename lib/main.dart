import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_do_flutter_app/models/chore_data.dart';
import 'package:we_do_flutter_app/screens/add_wedo_screen.dart';
import 'package:we_do_flutter_app/screens/home_screen.dart';
import 'package:we_do_flutter_app/screens/wedo_detail_screen.dart';
import 'package:we_do_flutter_app/screens/login_screen.dart';
import 'package:we_do_flutter_app/screens/registration_screen.dart';
import 'package:we_do_flutter_app/screens/welcome_screen.dart';
import 'package:we_do_flutter_app/util/theme_notifier.dart';
import 'package:we_do_flutter_app/values/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ChoreData(),
      child: MaterialApp(
        title: 'We Do',
        theme: orangeTheme,
        darkTheme: ThemeData.dark().copyWith(
          accentColor: orangeAccent,
          primaryColor: orangePrimary,
        ),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          WeDoDetailScreen.id: (context) => WeDoDetailScreen(),
          AddWeDoScreen.id: (context) => AddWeDoScreen(),
        },
      ),
    );
  }
}
