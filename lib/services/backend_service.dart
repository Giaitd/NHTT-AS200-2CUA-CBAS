import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BackendService extends GetxService {
  Future<dynamic> getRequestWithoutToken(
      String url, Map<String, dynamic> params,
      {dynamic body, Map<String, String>? headers}) async {
    var url_uri = Uri.parse(url).replace(queryParameters: params);
    final response = await http.get(
      url_uri,
      headers: {'Content-Type': 'application/json'},
    );

    try {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return {'status': response.statusCode, 'data': decodedData};
    } catch (e) {
      return {'status': response.statusCode, 'data': ''};
    }
  }

  Future<dynamic> postRequestWithoutToken(
      String url, Map<String, dynamic> params,
      {dynamic body, Map<String, String>? headers}) async {
    Uri uri = Uri.parse(url).replace(queryParameters: params);
    http.Response response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json',
          if (headers != null) ...headers,
        },
        body: json.encode(body));

    try {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return {'status': response.statusCode, 'data': decodedData};
    } catch (e) {
      return {'status': response.statusCode, 'data': ''};
    }
  }
}
