import 'package:flutter/material.dart';
import 'package:smart_scanner/constants.dart';
class ScanButton extends StatelessWidget {
  ScanButton({
    @required this.onPressed,
    @required this.child,
  });

  final Function onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 10.0,
      fillColor: kPrimaryColor,
      child: child,
      padding: EdgeInsets.all(15),
      shape: CircleBorder(),

    );
  }
}
