import 'dart:io';

import 'package:google_ml_kit/google_ml_kit.dart';

class GoogleMLApi {
  static Future<String> recogniseText(File imageFile) async {
    if (imageFile == null) {
      return 'No selected image';
    } else {
      final inputImage = InputImage.fromFile(imageFile);
      final textDetector = GoogleMlKit.vision.textDetector();
      try {
        final RecognisedText recognisedText =
            await textDetector.processImage(inputImage);
        await textDetector.close();

        final text = extractText(recognisedText);
        return text.isEmpty ? 'No text found in image' : text;
      } catch (e) {
        return e.toString();
      }
    }
  }

  static Future<String> labelImage(File imageFile) async {
    if (imageFile == null) {
      return 'No selected image';
    } else {
      final inputImage = InputImage.fromFile(imageFile);
      ImageLabeler imageLabeler = GoogleMlKit.vision.imageLabeler();
      try {
        final List<ImageLabel> labels =
            await imageLabeler.processImage(inputImage);
        await imageLabeler.close();
        final labellist = extractLabel(labels);
        return labellist.isEmpty ? 'No label found in image' : labellist;
      } catch (e) {
        return e.toString();
      }
    }
  }

  static extractText(RecognisedText recognisedText) {
    String text = '';

    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {
          text = text + element.text + ' ';
        }
        text = text + '\n';
      }
    }
    return text;
  }

  static extractLabel(List<ImageLabel> labels) {
    String result = '';
    int i = 1;
    for (ImageLabel label in labels) {
      result = result + '${label.label} \n';
      i++;
      if (i == 6) {
        break;
      }
    }
    return result;
  }
}
