import 'package:flutter/material.dart';
import 'package:fyp1_test/widgets/image_labelling_widget.dart';

class LabelScreen extends StatefulWidget {
  const LabelScreen({Key key}) : super(key: key);

  @override
  _LabelScreenState createState() => _LabelScreenState();
}

class _LabelScreenState extends State<LabelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Labeller"),
      ),
      body: Column(
        children: [
          SizedBox(height: 25),
          ImageLabellingWidget(),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
