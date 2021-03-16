import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_scanner/screens/home_screens/language_selection.dart';

import 'package:smart_scanner/screens/home_screens/main_home_screen.dart';
import 'package:smart_scanner/screens/home_screens/translated_text.dart';
import 'package:smart_scanner/screens/loginOrSignUp/login_or_signup_screen.dart';
import 'package:smart_scanner/screens/loginOrSignUp/login_screen.dart';
import 'package:smart_scanner/screens/loginOrSignUp/signup_screen.dart';
import 'package:smart_scanner/screens/welcome/welcome_screen.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Scanner',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginOrSignupScreen.id: (context) => LoginOrSignupScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        MainHomeScreen.id: (context) => MainHomeScreen(),
        LanguageSelection.id: (context) => LanguageSelection(),
        TranslatedText.id: (context) => TranslatedText(),
      },
    );
  }
}
