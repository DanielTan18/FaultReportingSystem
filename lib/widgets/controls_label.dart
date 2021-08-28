import 'package:flutter/material.dart';

class ControlsLabelWidget extends StatelessWidget {
  final VoidCallback onClickedPickImage;
  final VoidCallback onClickedScanText;
  final VoidCallback onClickedClear;

  const ControlsLabelWidget({
    @required this.onClickedPickImage,
    @required this.onClickedScanText,
    @required this.onClickedClear,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: onClickedPickImage,
            child: Text('Pick Image'),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: onClickedScanText,
            child: Text('Extract Labels'),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: onClickedClear,
            child: Text('Take Image'),
          ),
          SizedBox(width: 25),
        ],
      );
}
