import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:interview_review_app/network/api/api_client_endpoint.dart';

class ApiClient {
  String host;

  //name constructor
  ApiClient() {
    host = ApiEndPoint.baseUrl;
  }

  dynamic get(String path) async {
    var url = getParsedUrl(path);
    print(url);
    final response = await http.get(url);
    return json.decode(response.body);
  }

  //Uri it tries converts string to url
  Uri getParsedUrl(String path) {
    return Uri.parse('$host$path');
  }
}
