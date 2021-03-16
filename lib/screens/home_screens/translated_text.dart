import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TranslatedText extends StatelessWidget {
  static const id = 'TranslatedText';
  var data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Translated Text'),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Center(
            child: SizedBox(
              child: SingleChildScrollView(
                child: SelectableText(
                  '$data',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
