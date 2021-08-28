import 'package:flutter/material.dart';
import 'package:fyp1_test/widgets/text_recognition_widget.dart';

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
