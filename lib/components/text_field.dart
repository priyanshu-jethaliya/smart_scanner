import 'package:flutter/material.dart';
import 'package:smart_scanner/constants.dart';


class TextFields extends StatelessWidget {
  TextFields({
    this.press,
    @required this.label,
    @required this.keyboardType,
    @required this.obscureText,
  });

  final Function press;
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      keyboardAppearance: MediaQuery.of(context).platformBrightness,
      obscureText: obscureText,
      autocorrect: true,
      keyboardType: keyboardType,
      onChanged: press,
      decoration: InputDecoration(
        hintText: label,
        labelStyle:
            TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kSecondaryColor, width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kSecondaryColor, width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
      ),
      cursorColor: Colors.black12,
    );
  }
}
