import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_scanner/constants.dart';
import 'package:smart_scanner/screens/home_screens/language_selection.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:smart_scanner/components/scan_button.dart';
import 'package:smart_scanner/components/floating_action_button.dart';
import 'package:smart_scanner/screens/home_screens/translated_text.dart';
import 'package:translator/translator.dart';

class OcrScreen extends StatefulWidget {
  @override
  _OcrScreenState createState() => _OcrScreenState();
}

class _OcrScreenState extends State<OcrScreen> {
  var result;
  File _image;
  String text = 'Hello';
  var output;

  final picker = ImagePicker();
  GoogleTranslator translator = GoogleTranslator();

  Future getImageFromCameraGallery(bool isCamera) async {
    final tempStore = await picker.getImage(
        source: (isCamera == true) ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      _image = File(tempStore.path);
    });
  }

  Future ocrfromanImage() async {
    result = '';

    FirebaseVisionImage myImage = FirebaseVisionImage.fromFile(_image);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(myImage);

    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          setState(() {
            result = result + ' ' + word.text;
          });
        }
      }
    }
  }

  void translate(String c) {
    translator.translate(result, to: '$c').then((translated) {
      setState(() {
        // print(result);
        output = translated;
        print(output);

        Navigator.pushNamed(context, TranslatedText.id,
            arguments: output);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _image == null
          ? Center(
              child: Text('Scan Image and translate'),
            )
          : Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Card(
                    child: Image.file(
                      _image,
                      fit: BoxFit.fill,
                      height: 250,
                      width: 250,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 15,
                    margin: EdgeInsets.all(10),
                  ),
                  ScanButton(
                    onPressed: ocrfromanImage,
                    child: Icon(
                      Icons.text_format,
                      size: 25,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                    width: double.infinity,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: SingleChildScrollView(
                          child: SelectableText(
                            '$result',
                          ),
                        ),
                        height: 250,
                        width: 250,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                          icon: Icon(Icons.copy),
                          onPressed: () {
                            Clipboard.setData(
                              new ClipboardData(text: result),
                            );
                            final snackBar =
                                SnackBar(content: Text('Copied to clipboard'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          splashColor: kPrimaryColor),
                      SizedBox(
                        width: 15,
                      ),
                      IconButton(
                        icon: Icon(Icons.g_translate),
                        onPressed: () async {
                          var value = await Navigator.pushNamed(
                              context, LanguageSelection.id);
                          setState(() {
                            translate(value);
                          });

                          print(value);
                        },
                        splashColor: kPrimaryColor,
                      ),
                    ],
                  ),
                ],
              ),
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
