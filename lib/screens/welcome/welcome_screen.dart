import 'package:smart_scanner/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_scanner/screens/loginOrSignUp/login_or_signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'WelcomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Image.asset(
              "assets/images/welcome_screen.png",
            ),
            Spacer(
              flex: 3,
            ),
            Text(
              "Welcome to our \nsmart scanner app",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  "Smart Scanner talk any person \nof your mother language.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .color
                        .withOpacity(0.64),
                  ),
                ),

              ],
            ),
            Spacer(
              flex: 3,
            ),
            FittedBox(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginOrSignupScreen.id);
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      'Skip',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .color
                              .withOpacity(0.8)),
                    ),
                    SizedBox(
                      width: kDefaultPadding / 4,
                    ),
                    Icon(
                      FontAwesomeIcons.arrowRight,
                      size: 15.0,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(0.8),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
