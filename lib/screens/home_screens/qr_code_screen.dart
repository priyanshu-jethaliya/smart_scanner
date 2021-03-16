import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:smart_scanner/components/scan_button.dart';

import 'package:smart_scanner/components/floating_action_button.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class QrCodeScreen extends StatefulWidget {
  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  File _image;
  final picker = ImagePicker();
  String result = '';

  Future getImageFromCameraGallery(bool isCamera) async {
    final tempStore = await picker.getImage(
        source: (isCamera == true) ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      _image = File(tempStore.path);
    });
  }

  Future decodeBarCode() async {
    FirebaseVisionImage barCodeImage = FirebaseVisionImage.fromFile(_image);
    BarcodeDetector barcodeDetector = FirebaseVision.instance.barcodeDetector();

    List barCodes = await barcodeDetector.detectInImage(barCodeImage);
    for (Barcode readableCode in barCodes) {
      print(readableCode.displayValue);
      setState(() {
        result = readableCode.displayValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _image == null
          ? Center(
              child: Text('Scan Bar Code'),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.center,
                  //height: 400,
                  child: Column(
                    children: [
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.file(
                          _image,
                          fit: BoxFit.fill,
                          height: 300,
                          width: 300,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        elevation: 15,
                        margin: EdgeInsets.all(10),
                      ),
                      ScanButton(
                        onPressed: decodeBarCode,
                        child: Icon(
                          Icons.qr_code_scanner,
                          size: 35,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                result,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Clipboard.setData(
                                  new ClipboardData(text: result));

                              final snackBar = SnackBar(
                                  content: Text('Copied to clipboard'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            icon: Icon(Icons.copy),
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionWidget(
        onPressed1: () {
          getImageFromCameraGallery(true);
        },
        onPressed2: () {
          getImageFromCameraGallery(false);
        },
      ),
    );
  }
}
