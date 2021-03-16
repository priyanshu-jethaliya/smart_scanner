import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_scanner/constants.dart';
import 'package:flutter/material.dart';
import 'package:smart_scanner/screens/home_screens/doc_scan_screen.dart';
import 'package:smart_scanner/screens/home_screens/ocr_screen.dart';
import 'package:smart_scanner/screens/home_screens/qr_code_screen.dart';


class MainHomeScreen extends StatefulWidget {
  static String id = 'MainHomeScreen';

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kPrimaryColor,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.qrcode),
                ),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(FontAwesomeIcons.facebookMessenger)),
              ],
            ),
            title: Text(
              'Hello,\nPriyanshu',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.solidUserCircle,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              QrCodeScreen(),
              DocScanScreen(),
              OcrScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
