import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_scanner/components/primary_button.dart';
import 'package:smart_scanner/components/text_field.dart';
import 'package:smart_scanner/screens/home_screens/main_home_screen.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'SignUpScreen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  String email, password;

  final _auth = FirebaseAuth.instance;

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      upperBound: 1,
      duration: Duration(
        seconds: 1,
      ),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacer(
                flex: 2,
              ),
              Hero(
                tag: 'logo',
                child: Container(
                  height: animation.value * 200,
                  width: animation.value * 200,
                  child: Image.asset(
                    "assets/icons/indian-flag-icon-12.png",
                    height: 150.0,
                  ),
                ),
              ),
              Spacer(),
              TextFields(
                press: (value) {
                  email = value;
                },
                label: 'Enter email',
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFields(
                press: (value) {
                  password = value;
                },
                label: 'Enter Password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              Spacer(),
              PrimaryButton(
                text: 'Sign up',
                press: () async {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if(newUser != null){
                      Navigator.pushNamed(context, MainHomeScreen.id);
                    }
                  } catch (e){
                    print(e);
                  }
                },
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
