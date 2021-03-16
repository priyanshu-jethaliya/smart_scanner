import 'package:flutter/material.dart';
import 'package:smart_scanner/components/primary_button.dart';
import 'package:smart_scanner/constants.dart';
import 'package:smart_scanner/screens/loginOrSignUp/login_screen.dart';
import 'package:smart_scanner/screens/loginOrSignUp/signup_screen.dart';

class LoginOrSignupScreen extends StatelessWidget {
  static String id = 'LoginOrSingUpScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          child: Column(
            children: <Widget>[
              Spacer(
                flex: 2,
              ),
              Hero(
                tag: 'logo',
                child: Image.asset(
                  "assets/icons/indian-flag-icon-12.png",
                ),
              ),
              Spacer(),
              Text(
                'SMART SCANNER',
                textAlign: TextAlign.center,
                style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText2.color)
                    .copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Spacer(),
              PrimaryButton(
                text: "Log in",
                color: Theme.of(context).colorScheme.secondary,
                press: () {
                  Navigator.pushNamed(
                    context,
                    LoginScreen.id,
                  );
                },
              ),
              SizedBox(
                height: kDefaultPadding * 1.5,
              ),
              PrimaryButton(
                text: "Sign up",
                press: () {
                  Navigator.pushNamed(context, SignUpScreen.id);
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
