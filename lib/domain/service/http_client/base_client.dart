import 'dart:convert';

import 'package:dnd_app/flavor/build_flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

abstract class BaseClient {
  final _client = http.Client();

  Future<String> getRequest(endpoint,
      {contentType = "", Map<String, String>? extraHeaders}) async {
    Map<String, String> headers = {};

    if (extraHeaders != null) {
      headers.addAll(extraHeaders);
    }

    final url = '${BuildFlavor.baseUrl}$endpoint';
    final response = await _client
        .get(Uri.parse('${BuildFlavor.baseUrl}$endpoint'), headers: headers);

    if (kDebugMode) {
      print("GET -> $url -- ${response.statusCode} ${response.reasonPhrase}");
      print("headers: $headers");
      print("response ${response.body}");
    }

    return response.body;
  }

  Future<http.Response> postRequest(endpoint, Object? requestBody,
      {contentType = ""}) async {
    Map<String, String> headers = {};

    final response = await _client.post(Uri.parse(BuildFlavor.baseUrl),
        headers: headers, body: jsonEncode(requestBody));

    if (kDebugMode) {
      print(
          "POST -> $endpoint -- ${response.statusCode} ${response.reasonPhrase}");
      print("headers: $headers");
      print("request body: $requestBody");
      print("response: ${response.body}");
    }

    return response;
  }
}
