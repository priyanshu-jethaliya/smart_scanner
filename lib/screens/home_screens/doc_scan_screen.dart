import 'package:flutter/material.dart';

import 'package:smart_scanner/components/floating_action_button.dart';

class DocScanScreen extends StatefulWidget {
  @override
  _DocScanScreenState createState() => _DocScanScreenState();
}

class _DocScanScreenState extends State<DocScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('DOC'),
      ),
      floatingActionButton: FloatingActionWidget(
        onPressed1: () {},
        onPressed2: () {},
      ),
    );
  }
}
