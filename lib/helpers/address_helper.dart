import 'dart:convert';

import 'package:http/http.dart' as http;

class AddressHelper {
  static Future<dynamic> getRequest(String url) async {
    http.Response response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        String jSonData = response.body;
        var decodeData = jsonDecode(jSonData);
        return decodeData;
      } else {
        return "Failed, no response";
      }
    } catch (err) {
      return "Failed";
    }
  }
}
