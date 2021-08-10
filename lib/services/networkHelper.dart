import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper({required this.url});

  Future getData() async {
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: dotenv.env['API_KEY']!,
        },
      );

      if (response.statusCode == 200) {
        String data = response.body;

        return jsonDecode(data);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
