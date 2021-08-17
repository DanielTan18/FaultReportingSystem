import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp1_test/widgets/text_recognition_widget.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Streetlight Code Scanner"),
      ),
      body: Column(
        children: [
          SizedBox(height: 25),
          TextRecognitionWidget(),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
