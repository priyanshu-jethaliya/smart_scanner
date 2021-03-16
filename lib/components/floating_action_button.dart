import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FloatingActionWidget extends StatelessWidget {
  FloatingActionWidget({
    @required this.onPressed1,
    @required this.onPressed2,
  });

  final Function onPressed1;
  final Function onPressed2;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: (){},
        label: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(FontAwesomeIcons.camera),
          onPressed: onPressed1,
        ),
        Container(
          color: Colors.white.withOpacity(0.9),
          width: 2,
          height: 15,
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.images),
          onPressed: onPressed2,
        )
      ],
    ));
  }
}
