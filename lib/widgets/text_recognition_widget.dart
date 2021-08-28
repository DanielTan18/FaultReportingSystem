import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../api/google_ml_kit.dart';
import 'controls_widget.dart';
import 'text_area_widget.dart';

class TextRecognitionWidget extends StatefulWidget {
  const TextRecognitionWidget({Key key}) : super(key: key);

  @override
  _TextRecognitionWidgetState createState() => _TextRecognitionWidgetState();
}

class _TextRecognitionWidgetState extends State<TextRecognitionWidget> {
  String text = '';
  File image;

  @override
  Widget build(BuildContext context) => Expanded(
          child: Column(
        children: [
          Expanded(child: buildImage()),
          const SizedBox(height: 16),
          ControlsWidget(
            onClickedPickImage: pickImage,
            onClickedScanText: scanText,
            onClickedClear: takeImage,
          ),
          const SizedBox(height: 16),
          TextAreaWidget(
            text: text,
            onClickedCopy: copyToClipboard,
          )
        ],
      ));
  Widget buildImage() => Container(
        child: image != null
            ? Image.file(image)
            : Icon(Icons.photo, size: 80, color: Colors.black),
      );

  Future takeImage() async {
    final file = await ImagePicker().getImage(source: ImageSource.camera);
    if (file != null) setImage(File(file.path));
  }

  Future pickImage() async {
    final file = await ImagePicker().getImage(source: ImageSource.gallery);
    if (file != null) setImage(File(file.path));
  }

  Future scanText() async {
    showDialog(
      context: context,
      builder: (_) => new Center(
        child: CircularProgressIndicator(),
      ),
    );
    final text = await GoogleMLApi.recogniseText(image);
    setText(text);

    Navigator.of(context).pop();
  }

  void clear() {
    setImage(null);
    setText('');
  }

  void copyToClipboard() {
    if (text.trim() != '') {
      FlutterClipboard.copy(text);
    }
  }

  void setImage(File newImage) {
    setState(() {
      image = newImage;
    });
  }

  void setText(String newText) {
    setState(() {
      text = newText;
    });
  }
}
