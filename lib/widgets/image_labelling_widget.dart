import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp1_test/widgets/controls_label.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'controls_widget.dart';
import 'text_area_widget.dart';
import '../api/google_ml_kit.dart';
import 'package:clipboard/clipboard.dart';
import 'package:image_picker/image_picker.dart';

class ImageLabellingWidget extends StatefulWidget {
  const ImageLabellingWidget({Key key}) : super(key: key);

  @override
  _ImageLabellingWidgetState createState() => _ImageLabellingWidgetState();
}

class _ImageLabellingWidgetState extends State<ImageLabellingWidget> {
  String text = '';
  File image;

  @override
  Widget build(BuildContext context) => Expanded(
          child: Column(
        children: [
          Expanded(child: buildImage()),
          const SizedBox(height: 16),
          ControlsLabelWidget(
            onClickedPickImage: pickImage,
            onClickedScanText: scanText,
            onClickedClear: clear,
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
    final text = await GoogleMLApi.labelImage(image);
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
